import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:picogram/models/user.dart' as model;
import 'package:picogram/resources/storage_methods.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection('user').doc(currentUser.uid).get();
    return model.User.fromSnap(snap);
  }

  // Signup user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String photoURL = await StorageMethods()
            .upoadImageToStorage('profilePics', file, false);
        // Add user to database

        model.User user = model.User(
          userName: username,
          uid: credential.user!.uid,
          email: email,
          bio: bio,
          photoURL: photoURL,
          followers: [],
          following: [],
        );
        await _firestore
            .collection('user')
            .doc(credential.user!.uid)
            .set(user.toJson());
        res = "success";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        res = "Incorrect Email";
      } else if (err.code == 'weak-password') {
        res = 'Password is too weak! It should be greater than 6 Characters';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> logInUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occured";

    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      } else {
        res = "Enter all the fields!";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'user-not-found') {
        res = 'Incorrect Email';
      } else if (err.code == 'wrong-password') {
        res = 'Wrong Password';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
