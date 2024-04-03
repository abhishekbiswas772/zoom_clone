import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoom_clone_app/utils/snak_bar.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Stream<User?> get getAuthChange => _auth.authStateChanges();
  User? get user => _auth.currentUser;

  Future<bool> siginWithGoogle(BuildContext context) async {
    bool res = false;
    try {
      final GoogleSignInAccount? googleUsr = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuthUsr =
          await googleUsr?.authentication;
      final credUsr = GoogleAuthProvider.credential(
          accessToken: googleAuthUsr?.accessToken,
          idToken: googleAuthUsr?.idToken);
      UserCredential userCredential = await _auth.signInWithCredential(credUsr);
      User? user = userCredential.user;
      if (user != null) {
        if (userCredential.additionalUserInfo?.isNewUser != null &&
            userCredential.additionalUserInfo?.isNewUser == true) {
          await _firebaseFirestore.collection('users').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'profilePhoto': user.photoURL
          });
        }
        res = true;
      }
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, e.message.toString());
      res = false;
    }
    return res;
  }

  void performSignOut() async {
    try {
      _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
