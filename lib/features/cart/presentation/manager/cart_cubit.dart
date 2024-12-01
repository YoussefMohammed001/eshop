import 'package:bloc/bloc.dart';
import 'package:eshop/core/utils/easy_loading.dart';
import 'package:eshop/core/utils/safe_print.dart';
import 'package:eshop/features/cart/domain/entities/cart_entities.dart';
import 'package:eshop/features/cart/domain/repositories/cart_base_repo.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartBaseRepo) : super(CartInitial());
   CartEntities cartEntities= CartEntities(subTotal: 0, cartItemsEntities: []);
  final CartBaseRepo cartBaseRepo;
  getCart(){
    emit(GetCartLoading());
    cartBaseRepo.getCart().then((value) {
      emit(GetCartSuccess(value));
    }).catchError((onError){
      safePrint(cartEntities.subTotal);
      safePrint(cartEntities.cartItemsEntities.length);
      emit(GetCartFailure());
    });
  }


  Future updateCart({required int id,required int quantity,}) async{
showLoading();
    cartBaseRepo.updateCart(id: id, quantity: quantity).then((value) {
      showSuccess(value.message);
    }).catchError((onError){
      showError(onError);
    });
}


  Future toggleCart({required int id}) async{
    showLoading();
    cartBaseRepo.toggleCart(id: id).then((value) {
      showSuccess(value.message);
    }).catchError((onError){
      showError(onError.toString());
    });
  }



}
