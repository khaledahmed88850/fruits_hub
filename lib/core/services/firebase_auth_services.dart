import 'dart:developer';

import 'package:e_commerce_app/core/errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
        log(e.code.toString());
        throw Customexception(message: 'كلمة المرور ضعيفة');
      } else if (e.code == 'email-already-in-use') {
        log(e.code.toString());
        throw Customexception(message: 'الحساب موجود بالفعل');
      } else if (e.code == ' network-request-failed') {
        log(e.code.toString());
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
        log(e.code.toString());
        throw Customexception(
            message: 'الرقم السري او البريد الإلكتروني غير صحيح');
      } else if (e.code == 'wrong-password') {
        log(e.code.toString());
        throw Customexception(
            message: 'الرقم السري أوالبريد الإلكتروني غير صحيح');
      } else if (e.code == 'invalid-email') {
        log(e.code.toString());
        throw Customexception(message: ' البريد الإلكتروني غير صالح');
      } else if (e.code == ' network-request-failed') {
        log(e.code.toString());
        throw Customexception(message: 'لا يوجد إتصال بالإنترنت');
      } else {
        throw Customexception(message: 'حدث خطأ ما. يرجى المحاولة مرة أخرى');
      }
    } catch (e) {
      log(e.toString());
      throw Customexception(message: 'حدث خطأ ما. يرجى المحاولة مرة أخرى');
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential))
        .user!;
  }

  Future<void> deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  bool isUserLoggedIn() => FirebaseAuth.instance.currentUser != null;
}
