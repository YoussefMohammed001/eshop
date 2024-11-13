import 'package:bloc/bloc.dart';
import 'package:eshop/core/entities/product_entity.dart';
import 'package:eshop/features/search/domain/use_cases/search_use_case.dart';
part 'search_state.dart';


class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchUseCase) : super(SearchInitial());
  List<ProductEntities> searchProducts = [];
  final SearchUseCase searchUseCase;
  bool isLoading = false;

  search({required String search}){
    isLoading = true;


    emit(SearchLoading());
    searchUseCase.execute(search: search).then((onValue){
      searchProducts = onValue;
      isLoading =false;
      emit(SearchSuccess());
    }).catchError((onError){
      isLoading =false;
      emit(SearchFailure(message: onError));
    });

  }
}

