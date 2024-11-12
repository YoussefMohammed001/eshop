import 'package:eshop/core/entities/product_entity.dart';
import 'package:eshop/core/utils/safe_print.dart';
import 'package:eshop/features/fav/data/data_sources/favourite_data_source.dart';
import 'package:eshop/features/fav/data/mapper/fav_mapper.dart';
import 'package:eshop/features/fav/data/models/get_fav_response.dart';
import 'package:eshop/features/fav/data/models/toggle_fav_model.dart';
import 'package:eshop/features/fav/domain/entities/fav_entities.dart';
import 'package:eshop/features/fav/domain/repositories/fav_base_repo.dart';

class FavRepoImp extends FavBaseRepo {
  final FavouriteDataSource favouriteDataSource;

  FavRepoImp(this.favouriteDataSource);

  @override
  Future<ToggleFavoriteResponse> toggleFav(int productId) async {
  final response = await favouriteDataSource.toggleFav(productId);
  return response;
  }

  @override
  Future<List<FavEntities>> getFav() async {
    try {
      final response = await favouriteDataSource.getFav();

      List<FavEntities> favEntities = response.data.favorites
          .map<FavEntities>((favItem) => FavMapper.mapToEntities(favItem))
          .toList();

      return favEntities;
    } catch (e) {
      safePrint("repooooooo $e");
      rethrow;
    }
  }



}