import 'package:eshop/features/home/domain/entities/home_entities.dart';
import 'package:eshop/features/home/domain/repositories/base_home_repo.dart';

class HomeUseCase{
final BaseHomeRepo baseHomeRepo;
  HomeUseCase({required this.baseHomeRepo});
  Future<HomeEntities> execute()async{
    return baseHomeRepo.getHomeData();
  }
}