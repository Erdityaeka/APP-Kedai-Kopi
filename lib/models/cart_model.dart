class CartModel {
  String name;
  int? price;
  int menuId;
  int quantity;

  CartModel(
      {required this.name,
      this.price,
      required this.menuId,
      required this.quantity});
}
