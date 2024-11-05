class ProductEntities {
  String _name = "";
  int _id = 0;
  double _price = 0;
  double _oldPrice = 0;
  double _discount = 0;
  String _image = "";
  bool _isInFavorite = false;
  bool _isInCart = false;

  ProductEntities({
    required String name,
    required int id,
    required double price,
    required double oldPrice,
    required double discount,
    required String image,
    required bool isInCart,
    required bool isFav,
  }) {
    _name = name;
    _id = id;
    _price = price;
    _oldPrice = oldPrice;
    _discount = discount;
    _image = image;
    _isInFavorite = isFav;
    _isInCart = isInCart;
  }

  // Factory constructor for an empty product
  factory ProductEntities.empty() {
    return ProductEntities(
      name: '',
      id: 0,
      price: 0,
      oldPrice: 0,
      discount: 0,
      image: '',
      isInCart: false,
      isFav: false,
    );
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