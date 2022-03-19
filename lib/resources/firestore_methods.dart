import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:picogram/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

import '../models/post.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(String desctiption, Uint8List file, String uid,
      String username, String profileImage) async {
    var res = 'Some error occurred';
    try {
      String postURL =
      await StorageMethods().upoadImageToStorage('posts', file, true);

      String postID = const Uuid().v1();
      Post post = Post(
        description: desctiption,
        uid: uid,
        userName: username,
        postId: postID,
        datePublished: DateTime.now(),
        postURL: postURL,
        profImage: profileImage,
        likes: [],
      );

      _firestore.collection('posts').doc(postID).set(post.toJson());
      res = "success";
    } catch (error) {
      res = error.toString();
    }
    return res;
  }

  Future<void> likePost(String postId, String uid, List likes) async {
    String res = "Message";
    try {
      if (likes.contains(uid)) {
       await _firestore.collection('posts').doc(postId).update({
        'likes':FieldValue.arrayRemove([uid]),
        });
      } else {
        await _firestore.collection('posts').doc(postId).update({
          'likes':FieldValue.arrayUnion([uid]),
        });
        res = "success";
      }
    } catch (error) {
      res = error.toString();
    } finally {
      print(res);
    }
  }
}
