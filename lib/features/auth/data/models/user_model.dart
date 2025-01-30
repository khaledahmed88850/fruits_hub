import 'package:e_commerce_app/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.uId});
  factory UserModel.fromirebaseUser(User user) {
    return UserModel(
        name: user.displayName ?? '', email: user.email ?? '', uId: user.uid);
  }
}
