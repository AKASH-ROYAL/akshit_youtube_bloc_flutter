class ProductDataModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  bool itemCarted;
  bool itemWishlisted;

  ProductDataModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      this.itemCarted = false,
      this.itemWishlisted = false,
      required this.imageUrl});
}
