import 'package:eshop/features/fav/data/models/toggle_fav_model.dart';
import 'package:eshop/features/fav/domain/entities/fav_entities.dart';
import 'package:eshop/features/fav/domain/repositories/fav_base_repo.dart';

class FavUseCase{
  final FavBaseRepo repo;
  FavUseCase(this.repo);

  Future<ToggleFavoriteResponse> fire(int productId)async{
    return await repo.toggleFav(productId);
  }

    Future<List<FavEntities>> getFav()async{
    return await repo.getFav();
  }


}