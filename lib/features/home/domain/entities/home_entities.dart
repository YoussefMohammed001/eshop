class HomeEntities {

  List<HomeBannerEntities> _banners = [];
  List<HomeProductsEntities> _products = [];

  HomeEntities({required List<HomeBannerEntities> banners, required List<
      HomeProductsEntities> products}) {
    _banners = banners;
    _products = products;
  }

  List<HomeBannerEntities> get banners => _banners;
  List<HomeProductsEntities> get products => _products;
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

class HomeProductsEntities{
  String _name = "";
  int _id = 0;
  double _price = 0;
  double _oldPrice =0;
  double _discount =0;
  String _image="";
  bool _isInFavorite = false;
  bool _isInCart = false;

   HomeProductsEntities({
    required String name,
    required int id,
    required double price,
    required double oldPrice,
    required double discount,
    required String image,
    required bool isInCart, required isFav,

}){
    _name = name;
    _id = id;
    _price = price;
    _oldPrice = oldPrice;
    _discount = discount;
    _image = image;
    _isInFavorite = isInFavorite;
    _isInCart = isInCart;
  }

  double get discount => _discount;

  String get name => _name;

  int get id => _id;

  double get price => _price;

  double get oldPrice => _oldPrice;

  String get image => _image;

  bool get isInFavorite => _isInFavorite;

  bool get isInCart => _isInCart;

  set isInFavorite(bool value) {
    _isInFavorite = value;
  }

  set isInCart(bool value) {
    _isInCart = value;
  }

}