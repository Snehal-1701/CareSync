class ProductData {
  final String name;
  final String productId;
  final dynamic price;
  dynamic mrp;
  final dynamic image;
  // dynamic rating;
  // dynamic liked;
  // int quantity;
  // bool isInCart;

  ProductData({
    required this.name,
    required this.productId,
    required this.price,
    required this.mrp,
    required this.image,
    // this.rating,
    // this.liked,
    // this.quantity = 1,
    // this.isInCart = false,
  });
}
