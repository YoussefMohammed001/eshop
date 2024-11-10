import 'package:eshop/core/network/api_service.dart';
import 'package:eshop/core/network/endpoints.dart';
import 'package:eshop/features/fav/data/models/get_fav_response.dart';
import 'package:eshop/features/fav/data/models/toggle_fav_model.dart';

class FavouriteDataSource {


  Future<ToggleFavoriteResponse> toggleFav(int productId) async {
   final response = await ApiService.postData(endPoint: ApiConstants.favoriteToggle, data: {
"product_id":productId
   });
   ToggleFavoriteResponse toggleFavoriteResponse = ToggleFavoriteResponse.fromJson(response);
   return toggleFavoriteResponse;
  }

  Future<FavoritesResponse> getFav() async {
    final response = await ApiService.getData(endPoint: ApiConstants.favorite);
    FavoritesResponse favoritesResponse = FavoritesResponse.fromJson(response);
    return favoritesResponse;
  }


}
