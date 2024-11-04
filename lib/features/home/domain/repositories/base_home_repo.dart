import 'package:eshop/features/home/domain/entities/home_entities.dart';

abstract class BaseHomeRepo {
  Future<HomeEntities> getHomeData();
}