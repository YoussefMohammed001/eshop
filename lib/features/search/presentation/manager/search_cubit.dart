import 'package:bloc/bloc.dart';
import 'package:eshop/core/models/products_model.dart';
import 'package:eshop/features/search/data/repositories/search_repo_imp.dart';
import 'package:meta/meta.dart';
part 'search_state.dart';


class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepoImp) : super(SearchInitial());
  List<ProductsModel> searchModel = [];
  final SearchRepoImp searchRepoImp;
  bool isLoading = false;

  search({required String search}){
    isLoading = true;

    emit(SearchLoading());
    searchRepoImp.getSearchRepo(query: search).then((onValue){
      searchModel = onValue;

      isLoading =false;
      emit(SearchSuccess());
    }).catchError((onError){
      isLoading =false;
      emit(SearchFailure(message: onError));
    });

  }
}

