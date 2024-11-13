import 'package:eshop/core/entities/product_entity.dart';
import 'package:eshop/features/search/domain/repositories/search_base_repo.dart';

class SearchUseCase{
  final SearchBaseRepo searchBaseRepo;
  SearchUseCase(this.searchBaseRepo);

  Future<List<ProductEntities>> execute({required String search}){
    return searchBaseRepo.getSearch(searchText: search);
  }

}