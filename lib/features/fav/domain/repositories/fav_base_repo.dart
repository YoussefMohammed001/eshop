import 'package:eshop/features/fav/data/models/toggle_fav_model.dart';
import 'package:eshop/features/fav/domain/entities/fav_entities.dart';

abstract class FavBaseRepo {
  Future<ToggleFavoriteResponse> toggleFav(int productId);
  Future<List<FavEntities>> getFav();
}