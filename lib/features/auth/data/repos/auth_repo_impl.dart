import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/errors/exceptions.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/core/services/database_services.dart';
import 'package:e_commerce_app/core/services/firebase_auth_services.dart';
import 'package:e_commerce_app/core/services/shared_preferences_singleton.dart';
import 'package:e_commerce_app/core/utils/backend_endpoints.dart';
import 'package:e_commerce_app/features/auth/data/models/user_model.dart';
import 'package:e_commerce_app/features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;
  final DatabaseServices databaseServices;

  AuthRepoImpl(
      {required this.databaseServices, required this.firebaseAuthServices});
  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    User? user;
    try {
      user = await firebaseAuthServices.createUserWithEmailAndPassword(
          emailAddress: email, password: password);

      var userEntity = UserModel(email: user.email!, uId: user.uid, name: name);

      await addUserData(user: userEntity);
      return right(userEntity);
    } on Customexception catch (e) {
      await deleteUsers(user);
      return left(ServerFailure(message: e.message));
    } catch (e) {
      if (user != null) {
        await firebaseAuthServices.deleteUser();
      }
      return left(
          ServerFailure(message: 'حدث خطأ ما. يرجى المحاولة مرة أخرى'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      var user = await firebaseAuthServices.signInWithEmailAndPassword(
          emailAddress: email, password: password);
      var userEntity = await getUserData(uId: user.uid);
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on Customexception catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(
          ServerFailure(message: 'حدث خطأ ما. يرجى المحاولة مرة أخرى'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithGoogle();
      UserEntity userEntity = UserModel.fromirebaseUser(user);
      var dataExists = await databaseServices.ifDataExists(
          path: BackendEndpoints.userData, documentId: userEntity.uId);
      if (dataExists) {
        await getUserData(uId: userEntity.uId);
        await saveUserData(user: userEntity);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } catch (e) {
      await deleteUsers(user);
      return left(
          ServerFailure(message: ' حدث خطأ ما. يرجى المحاولة مرة أخرى'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithFacebook();
      UserEntity userEntity = UserModel.fromirebaseUser(user);
      var dataExists = await databaseServices.ifDataExists(
          path: BackendEndpoints.userData, documentId: userEntity.uId);
      if (dataExists) {
        await getUserData(uId: userEntity.uId);
         await saveUserData(user: userEntity);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } catch (e) {
      await deleteUsers(user);
      return left(
          ServerFailure(message: ' حدث خطأ ما. يرجى المحاولة مرة أخرى'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    databaseServices.addData(
        documentId: user.uId,
        path: BackendEndpoints.userData,
        data: UserModel.toEntity(user).toMap());
  }

  Future<void> deleteUsers(User? user) async {
    if (user != null) {
      await firebaseAuthServices.deleteUser();
    }
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var userData = await databaseServices.getData(
        path: BackendEndpoints.userData, documentId: uId);
    return UserModel.fromJson(userData);
  }
  
  @override
  Future saveUserData({required UserEntity user}) async{
    var jsonData = jsonEncode(UserModel.toEntity(user).toMap());
    await Prefs.setString(kUserData, jsonData);
      
  }
}