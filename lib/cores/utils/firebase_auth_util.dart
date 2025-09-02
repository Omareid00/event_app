import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_routes/app_routes.dart';

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



  static final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  //google auth
  static Future<UserCredential?> signInWithGoogle()
  async {
    try{
      await _googleSignIn.initialize(
        serverClientId: dotenv.env['SERVER_CLIENT_ID']
      );
      final GoogleSignInAccount result = await _googleSignIn.authenticate();
      final  googleAuth = result.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);

    }catch(e){
      print("Google Sign In Error: $e");
      return null;
    }

  }

  static Future<void> loginInWithGoogle(BuildContext context) async {
    try{
      await signInWithGoogle();
      EasyLoading.showSuccess('Signed in successfully');
      Navigator.pushNamed(context, APPROUTES.LayoutView);
    }catch(e){
      EasyLoading.showError('Failed to sign in');
    }
  }



}
