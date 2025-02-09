
import 'package:e_commerce_app/core/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final String date;
  final num rating;
  final String comment;

  ReviewModel(
      {required this.name,
      required this.image,
      required this.date,
      required this.rating,
      required this.comment});

  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
      name: reviewEntity.name,
      image: reviewEntity.image,
      date: reviewEntity.date,
      rating: reviewEntity.rating,
      comment: reviewEntity.comment,
    );
  }
 ReviewEntity  toEntity () {
    return ReviewEntity(
      name: name,
      image: image,
      date: date,
      rating: rating,
      comment: comment,
    );
  }
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json["name"],
      image: json["image"],
      date: json["date"],
      rating: json["rating"],
      comment: json["comment"],
    );  
  }

  toJson() {
    return {
      "name": name,
      "image": image,
      "date": date,
      "rating": rating,
      "comment": comment,
    };
  }
}
