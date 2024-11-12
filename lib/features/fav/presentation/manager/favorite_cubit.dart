import 'package:bloc/bloc.dart';
import 'package:eshop/core/utils/safe_print.dart';
import 'package:eshop/features/fav/domain/entities/fav_entities.dart';
import 'package:eshop/features/fav/domain/use_cases/fav_use_case.dart';
part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.favUseCase) : super(FavoriteInitial());
  final FavUseCase favUseCase;
  bool isLoading = false;
   List<FavEntities> favorites = [];
  Future<bool> toggleFav(int productId)async{
    emit(ToggleFavoriteLoading());
final response = await favUseCase.fire(productId);
      if(response.status == true){
        emit(ToggleFavoriteSuccess(message:  response.message,));
        return true;
      }
      else{
        safePrint("${response.message}  fail");
        emit(ToggleFavoriteFailure(message: response.message,));
        return false;
      }
    }


    Future getFav()async{
      isLoading  =true;
      emit(GetFavLoading());
      await favUseCase.getFav().then((onValue){
          favorites = onValue;
          emit(GetFavSuccess());
          isLoading  = false;
      }).catchError((e){
        emit(GetFavFailure(errorMessage: e));
      });

    }

}

