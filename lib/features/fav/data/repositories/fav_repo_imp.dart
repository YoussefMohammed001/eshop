import 'package:eshop/features/fav/data/data_sources/favourite_data_source.dart';
import 'package:eshop/features/fav/data/models/get_fav_response.dart';
import 'package:eshop/features/fav/data/models/toggle_fav_model.dart';
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
  Future<FavoritesResponse> getFav() async {
    final response = await favouriteDataSource.getFav();
    return response;
  }


}