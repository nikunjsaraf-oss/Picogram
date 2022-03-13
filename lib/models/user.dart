class User {
  final String email;
  final String uid;
  final String photoURL;
  final String userName;
  final String bio;
  final List followers;
  final List following;

  const User({
    required this.email,
    required this.uid,
    required this.photoURL,
    required this.userName,
    required this.bio,
    required this.followers,
    required this.following,
  });

  Map<String,dynamic> toJson()=>{
    'username': userName,
    'uid': uid,
    'email': email,
    'bio': bio,
    'followers': followers,
    'following': following,
    'photoURl': photoURL,
  };
}
