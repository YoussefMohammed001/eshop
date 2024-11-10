import 'package:eshop/features/fav/data/models/get_fav_response.dart';
import 'package:eshop/features/fav/data/models/toggle_fav_model.dart';
import 'package:eshop/features/fav/domain/repositories/fav_base_repo.dart';

class FavUseCase{
  final FavBaseRepo repo;
  FavUseCase(this.repo);

  Future<ToggleFavoriteResponse> fire(int productId)async{
    return await repo.toggleFav(productId);
  }

    Future<FavoritesResponse> getFav()async{
    return await repo.getFav();
  }


}