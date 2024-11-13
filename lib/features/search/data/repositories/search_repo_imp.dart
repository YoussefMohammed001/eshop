import 'package:eshop/core/entities/product_entity.dart';
import 'package:eshop/core/utils/safe_print.dart';
import 'package:eshop/features/search/data/data_sources/search_api.dart';
import 'package:eshop/features/search/data/search_mapper/search_mapper.dart';
import 'package:eshop/features/search/domain/repositories/search_base_repo.dart';

class SearchRepoImp extends SearchBaseRepo{
  final SearchApi searchApi;

  SearchRepoImp({required this.searchApi});

  @override
  Future<List<ProductEntities>> getSearch({required String searchText}) async {
    try {
      final response = await searchApi.getSearchApi(query: searchText);
      safePrint("repo $response");
      List<ProductEntities> productEntities = SearchMapper.mapToProductEntity(response);
      return productEntities;
    }catch(e){
      safePrint("repo error====>$e");
      rethrow;
    }
  }


}