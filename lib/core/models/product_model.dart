import 'dart:io';

import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/models/review_model.dart';

class ProductModel {
  final String name;
  final int price;
  final String code;
  final String description;
  String? imageUrl;
  final bool isFeatured;
  final int expirationInMonths;
  final bool isOrganic;
  final int calories;
  final int unitAmount;
  final int sellingCount;
  double avgRating ;
  int numRating ;
  final List<ReviewModel> reviews;
  ProductModel({
    this.avgRating = 0.0,
    this.numRating = 0,
    required this.name,
    required this.price,
    required this.code,
    required this.description,
    this.imageUrl,
    required this.isFeatured,
    required this.isOrganic,
    required this.sellingCount,
    required this.expirationInMonths,
    required this.calories,
    required this.unitAmount,
    required this.reviews,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      avgRating: getAvgRating(json['reviews']),
      name: json['name'],
      price: json['price'],
      code: json['code'],
      description: json['description'],
      imageUrl: json['imageurl'],
      isFeatured: json['isFeatured'],
      isOrganic: json['isOrganic'],
      expirationInMonths: json['expirationInMonths'],
      calories: json['calories'],
      unitAmount: json['amountType'],
      sellingCount: json['sellingCount'],
      reviews: json['reviews'] == null
          ? []
          : List<ReviewModel>.from(
              json['reviews'].map((x) => ReviewModel.fromJson(x))),

    );
  }
  ProductEntity toEntity() {
    return ProductEntity(
      avgRating: avgRating,
      name: name,
      price: price,
      code: code,
      description: description,
      imageUrl: imageUrl,
      isFeatured: isFeatured,
      isOrganic: isOrganic,
      expirationInMonths: expirationInMonths,
      calories: calories,
      unitAmount: unitAmount,
      reviews: reviews.map((e) => e.toEntity()).toList(),
    );
  }

  toJson() {
    return {
      'name': name,
      'price': price,
      'code': code,
      'description': description,
      'imageurl': imageUrl,
      'isFeatured': isFeatured,
      'isOrganic': isOrganic,
      'expirationInMonths': expirationInMonths,
      'sellingCount': sellingCount,
      'calories': calories,
      'amountType': unitAmount,
      'avg rating': avgRating,
      'number of rating': numRating,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}

getAvgRating( reviews) {
  if (reviews.isEmpty) return 0.0;
  double sum = 0.0;
  for (var review in reviews) {
    sum += review.rating;
  }
  return sum / reviews.length;
}
