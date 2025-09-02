import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FirebaseAuthUtil {
  static Future<String?> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
  )
  async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      var user = credential.user;
      if (user != null) {
        user.updateDisplayName(name);
        prefs.setString('userId', user.uid);
        prefs.setString('userName', name);
        prefs.setString('userEmail', email);
        return 'success';
      }
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      return 'unexpected';
    }
    return 'unexpected';
  }

  static Future<String?> signInUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      var user = credential.user;
      if (user != null) {
        prefs.setString('userId', user.uid);
        prefs.setString('userName', user.displayName!);
        prefs.setString('userEmail', email);
        return 'success';
      }
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      return 'unexpected';
    }
    return 'unexpected';
  }


}
