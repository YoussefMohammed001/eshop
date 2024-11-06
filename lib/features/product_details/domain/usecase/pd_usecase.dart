import 'package:eshop/core/entities/product_entity.dart';
import 'package:eshop/features/product_details/domain/repo/pd_base_repo.dart';

class PDUseCase{
  final  PDBaseRepo productDetailsRepo;
  PDUseCase(this.productDetailsRepo);
  Future<ProductEntities> getProductDetails({required int id}) async {
    return await productDetailsRepo.getProductDetails(id: id);
  }
}