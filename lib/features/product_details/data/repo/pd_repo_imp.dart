import 'package:eshop/core/entities/product_entity.dart';
import 'package:eshop/core/utils/safe_print.dart';
import 'package:eshop/features/product_details/data/data_source/product_details_api.dart';
import 'package:eshop/features/product_details/data/models/product_details_model.dart';
import 'package:eshop/features/product_details/domain/repo/pd_base_repo.dart';

class PDRepoImp extends PDBaseRepo{
  final ProdcutDetailsApi productDetailsApi;

  PDRepoImp(this.productDetailsApi);
  @override
  Future<ProductEntities> getProductDetails({required int id}) async {
    final response = await productDetailsApi.getProductDetails(id: id);
    safePrint("response repo  ===> $response");
   try{
     safePrint("repo $response");
     ProductEntities productEntities = Mapper.mapToProductEntity(response);
     return productEntities;
   }catch(e){
     safePrint("repo $e");
     rethrow;
   }

  }

}

class Mapper{
      static ProductEntities mapToProductEntity(ProductDetailsData product) {
    return ProductEntities(
      id: product.id,
      image: product.image,
      name: product.name,
      price: product.price,
      isFav: product.inFavorites,
      oldPrice: product.oldPrice, isInCart: product.inCart, discount: product.discount.toDouble(), images: product.images, description: product.description,
    );
  }
}