class Product {
  final String barcode;
  final String brand;
  final String category;
  final String item;
  final String description;
  final String unit;
  final String unitPrice;
  final String itemPhoto;

  Product({
    required this.barcode,
    required this.brand,
    required this.category,
    required this.item,
    required this.description,
    required this.unit,
    required this.unitPrice,
    required this.itemPhoto,
  });

  Map<String, dynamic> toMap() {
    return {
      'barcode': barcode,
      'brand': brand,
      'category': category,
      'item': item,
      'description': description,
      'unit': unit,
      'unit_price': unitPrice,
      'item_photo': itemPhoto,
    };
  }
}