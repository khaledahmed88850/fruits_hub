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
      return credential.user! ;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        throw Customexception(message: 'كلمة المرور ضعيفة');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email');
        throw Customexception(message: 'الحساب موجود بالفعل');
      }
      else 
      {
        throw Customexception(message: ' حدث خطأ ما. يرجى المحاولة مرة أخرى'); 
      }
    } catch (e) {
      throw Customexception(message: 'حدث خطأ ما. يرجى المحاولة مرة أخرى');
    }
  }
}
