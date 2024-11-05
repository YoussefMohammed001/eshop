import 'package:eshop/core/entities/product_entity.dart';

class HomeEntities {

  List<HomeBannerEntities> _banners = [];
  List<ProductEntities> _products = [];

  HomeEntities({required List<HomeBannerEntities> banners, required List<
      ProductEntities> products}) {
    _banners = banners;
    _products = products;
  }

  List<HomeBannerEntities> get banners => _banners;
  List<ProductEntities> get products => _products;
}

class HomeBannerEntities{

  String _image="";
  int _id=0;

  HomeBannerEntities({required String image,required int id}){
    _image=image;
    _id=id;
  }

  String get image => _image;

  int get id => _id;

}

