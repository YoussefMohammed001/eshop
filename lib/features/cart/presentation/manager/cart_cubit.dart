import 'package:bloc/bloc.dart';
import 'package:eshop/core/utils/safe_print.dart';
import 'package:eshop/features/cart/domain/entities/cart_entities.dart';
import 'package:eshop/features/cart/domain/repositories/cart_base_repo.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartBaseRepo) : super(CartInitial());
   CartEntities cartEntities= CartEntities(subTotal: 0, cartItemsEntities: []);
  final CartBaseRepo cartBaseRepo;
bool isLoading=true;

  getCart(){
    emit(GetCartLoading());
    cartBaseRepo.getCart().then((value) {
      cartEntities = value;
      isLoading=false;

      emit(GetCartSuccess());
    }).catchError((onError){
      isLoading=false;
      safePrint(cartEntities.subTotal);
      safePrint(cartEntities.cartItemsEntities.length);
      emit(GetCartFailure());
    });
  }

}
