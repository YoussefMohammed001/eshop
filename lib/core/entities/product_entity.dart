class ProductEntities {
  String _name = "";
  String _description = "";
  int _id = 0;
  double _price = 0;
  List<String>  _images = [];
  double _oldPrice = 0;
  double _discount = 0;
  String _image = "";
  bool _isInFavorite = false;
  bool _isInCart = false;

  ProductEntities({
    required String name,
    required String description,
    required int id,
    required List<String> images,
    required double price,
    required double oldPrice,
    required double discount,
    required String image,
    required bool isInCart,
    required bool isFav,
  }) {
    _name = name;
    _description = description;
    _id = id;
    _price = price;
    _oldPrice = oldPrice;
    _discount = discount;
    _image = image;
    _isInFavorite = isFav;
    _isInCart = isInCart;
    _images = images;
  }

  // Factory constructor for an empty product
  factory ProductEntities.empty() {
    return ProductEntities(
      name: '',
      id: 0,
      description: '',
      price: 0,
      oldPrice: 0,
      discount: 0,
      image: '',
      isInCart: false,
      isFav: false,
      images: [],
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
  String get description => _description;


  List<String> get images => _images;

  set isInFavorite(bool value) {
    _isInFavorite = value;
  }

  set isInCart(bool value) {
    _isInCart = value;
  }
}