import 'review_entity.dart';

class ProductEntity {
  final String name;
  final int price;
  final String code;
  final String description;
  String? imageUrl;
  final int expirationInMonths;
  final bool isOrganic;
  final int calories;
  final int unitAmount;
  final bool isFeatured;
  double avgRating;
  int numRating;
  final List<ReviewEntity> reviews;

  ProductEntity(
      {this.avgRating = 0.0,
      this.numRating = 0,
      required this.name,
      required this.price,
      required this.code,
      required this.description,
      this.imageUrl,
      required this.isFeatured,
      required this.isOrganic,
      required this.expirationInMonths,
      required this.calories,
      required this.unitAmount,
      required this.reviews});

  toMap() {
    return {
      'name': name,
      'price': price,
      'code': code,
      'description': description,
      'imageUrl': imageUrl,
      'isFeatured': isFeatured,
      'isOrganic': isOrganic,
      'expirationInMonths': expirationInMonths,
      'calories': calories,
      'unitAmount': unitAmount,
    };
  }
}
