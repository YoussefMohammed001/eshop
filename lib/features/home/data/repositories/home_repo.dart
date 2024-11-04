import 'package:eshop/core/utils/safe_print.dart';
import 'package:eshop/features/home/data/data_sources/home_api.dart';
import 'package:eshop/features/home/data/mapper/home_mapper.dart';
import 'package:eshop/features/home/domain/entities/home_entities.dart';
import 'package:eshop/features/home/domain/repositories/base_home_repo.dart';

class HomeRepoImpl extends BaseHomeRepo {
  final HomeApi homeApi;
  HomeRepoImpl({
    required this.homeApi,
  });

  @override
  Future<HomeEntities> getHomeData() async {
    final response = await homeApi.getHomeDataApi();
    safePrint(response);
    if (response.status == true) {
      HomeEntities homeEntity = HomeMapper.mapToEntity(response.data);
      return homeEntity;
    } else {
      return HomeEntities(banners: [], products: []);
    }
  }
}
