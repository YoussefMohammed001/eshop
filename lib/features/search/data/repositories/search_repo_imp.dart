import 'package:eshop/core/models/products_model.dart';
import 'package:eshop/core/utils/safe_print.dart';
import 'package:eshop/features/home/data/models/home_response.dart';
import 'package:eshop/features/search/data/data_sources/search_api.dart';

class SearchRepoImp {
  final SearchApi searchApi;

  SearchRepoImp({required this.searchApi});

  Future<List<ProductsModel>> getSearchRepo({required String query})async{
try {
  final response = await searchApi.getSearchApi(query: query);
  safePrint("repo $response");
  return response;
}catch(e){
  safePrint("repo error====>$e");
  rethrow;
}
}

}