import 'package:bloc/bloc.dart';
import 'package:eshop/core/entities/product_entity.dart';
import 'package:eshop/core/utils/safe_print.dart';
import 'package:eshop/features/product_details/domain/usecase/pd_usecase.dart';
import 'package:meta/meta.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.productDetailsUseCae) : super(ProductDetailsInitial());
  final PDUseCase productDetailsUseCae;


  Future<void> getProductDetails({required int id}) async {
    safePrint("Get Product Details: $id");
    emit(ProductDetailsLoading());
    try {
 await productDetailsUseCae.getProductDetails(id: id).then((onValue){
   safePrint ("value=========>${onValue.name}");
   emit(ProductDetailsSuccess(productEntities: onValue));
 });
    } catch (e) {
      safePrint("Get Product Details: $e");
      emit(ProductDetailsFailure());
    }
  }
}
