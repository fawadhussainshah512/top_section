
class DealData {
  final String id;
  final String title;
  final double price;
  final String status;
  final int soldCount;
  final String? badge;
  final String? image;
  final double priceOff;

  DealData({
    required this.id,
    required this.title,
    required this.price,
    required this.status,
    required this.soldCount,
    required this.priceOff,
    this.badge,
    this.image,
  });
}