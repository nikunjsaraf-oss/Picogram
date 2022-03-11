import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:picogram/resources/storage_methods.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
        await _firestore.collection('user').doc(credential.user!.uid).set({
          'username': username,
          'uid': credential.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
          'photoURl': photoURL,
        });
        res = "success";
      }
    } on FirebaseAuthException catch(err){
      if(err.code == 'invalid-email'){
        res = "Not a valid email";
      } else if(err.code == 'weak-password'){
        res = 'Password is too weak! It should be greater than 6 Characters';
      }
    }
    catch (err) {
      res = err.toString();
    }
    return res;
  }
}
