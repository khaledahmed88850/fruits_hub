import 'dart:developer';

import 'package:e_commerce_app/core/errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  Future<User> createUserWithEmailAndPassword(
      {required String emailAddress, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log(e.message.toString());
        throw Customexception(message: 'كلمة المرور ضعيفة');
      } else if (e.code == 'email-already-in-use') {
        log(e.message.toString());
        throw Customexception(message: 'الحساب موجود بالفعل');
      }
       else if (e.code == ' network-request-failed') {
        log(e.message.toString());
        throw Customexception(message: 'لا يوجد إتصال بالإنترنت');
      } else {
        log(e.message.toString());
        throw Customexception(message: ' حدث خطأ ما. يرجى المحاولة مرة أخرى');
      }
    } catch (e) {
      log(e.toString());
      throw Customexception(message: 'حدث خطأ ما. يرجى المحاولة مرة أخرى');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String emailAddress, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log(e.message.toString());
        throw Customexception(message: 'الرقم السري او البريد الإلكتروني غير صحيح');
      } else if (e.code == 'wrong-password') {
        log(e.message.toString());
        throw Customexception(message: 'الرقم السري أوالبريد الإلكتروني غير صحيح');
      } 
      else if (e.code == ' invalid-email') {
        log(e.message.toString());
        throw Customexception(message: ' البريد الإلكتروني غير صالح');
      }
      else if (e.code == ' network-request-failed') {
        log(e.message.toString());
        throw Customexception(message: 'لا يوجد إتصال بالإنترنت');
      }
      else {
        throw Customexception(message: 'حدث خطأ ما. يرجى المحاولة مرة أخرى');
      }
    } catch (e) {
      throw Customexception(message: 'حدث خطأ ما. يرجى المحاولة مرة أخرى');
    }
  }
}
