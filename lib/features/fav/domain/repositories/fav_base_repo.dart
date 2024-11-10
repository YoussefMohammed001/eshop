import 'package:eshop/features/fav/data/models/get_fav_response.dart';
import 'package:eshop/features/fav/data/models/toggle_fav_model.dart';

abstract class FavBaseRepo {
  Future<ToggleFavoriteResponse> toggleFav(int productId);
  Future<FavoritesResponse> getFav();
}