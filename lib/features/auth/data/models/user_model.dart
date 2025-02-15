import 'package:e_commerce_app/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({required super.email, required super.uId, required super.name});
  factory UserModel.fromirebaseUser(User user) {
    return UserModel(
        email: user.email ?? '', uId: user.uid, name: user.displayName ?? '');
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json['email'], uId: json['uId'], name: json['name']);
  }
  factory UserModel.toEntity(UserEntity user) {
    return UserModel(email: user.email, uId: user.uId, name: user.name);
  }

  toMap() {
    return {'name': name, 'email': email, 'uId': uId};
  }
}
