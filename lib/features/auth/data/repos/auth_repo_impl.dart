import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/exceptions.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/core/services/firebase_auth_services.dart';
import 'package:e_commerce_app/features/auth/data/models/user_model.dart';
import 'package:e_commerce_app/features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;

  AuthRepoImpl({required this.firebaseAuthServices});
  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      User user = await firebaseAuthServices.createUserWithEmailAndPassword(
          emailAddress: email, password: password);
      return right(UserModel.fromirebaseUser(user));
    } on Customexception catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
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
      return right(UserModel.fromirebaseUser(user));
    } on Customexception catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(
          ServerFailure(message: 'حدث خطأ ما. يرجى المحاولة مرة أخرى'));
    }
  }
  
  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
 try {
  var user  =  await firebaseAuthServices.signInWithGoogle();
  return right(UserModel.fromirebaseUser(user));
}  catch (e) {
  return left(ServerFailure(message: ' حدث خطأ ما. يرجى المحاولة مرة أخرى'));
}
  }
  
  @override
  Future<Either<Failures, UserEntity>> signInWithFacebook() async{
  try {
  var user   = await firebaseAuthServices.signInWithFacebook();
  return right(UserModel.fromirebaseUser(user)); 
}  catch (e) {
  return left(ServerFailure(message: ' حدث خطأ ما. يرجى المحاولة مرة أخرى'));
}
    
  }
}
