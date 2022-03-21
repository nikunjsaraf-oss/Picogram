import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String postId;
  final String userName;
  final DateTime datePublished;
  final String postURL;
  final String profImage;
  final likes;

  const Post({
    required this.description,
    required this.uid,
    required this.postId,
    required this.userName,
    required this.datePublished,
    required this.postURL,
    required this.profImage,
    required this.likes,
  });

  Map<String, dynamic> toJson() => {
        'description': description,
        'uid': uid,
        'postId': postId,
        'userName': userName,
        'datePublished': datePublished,
        'postURL': postURL,
        'profImage': profImage,
        'likes': likes,
      };

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      description: snapshot['description'],
      uid: snapshot['uid'],
      postId: snapshot['postId'],
      userName: snapshot['userName'],
      datePublished: snapshot['datePublished'],
      postURL: snapshot['postURL'],
      profImage: snapshot['profImage'],
      likes: snapshot['likes'],
    );
  }
}
