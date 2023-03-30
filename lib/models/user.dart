import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String username;
  final String email;
  final String uid;
  final String dob;
  final String gender;
  final String photoUrl;

  const User({
    required this.username,
    required this.email,
    required this.uid,
    required this.dob,
    required this.gender,
    required this.photoUrl,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'uid': uid,
        'dob': dob,
        'gender': gender,
        'photoUrl': photoUrl,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot['username'],
      email: snapshot['email'],
      uid: snapshot['uid'],
      dob: snapshot['dob'],
      gender: snapshot['gender'],
      photoUrl: snapshot['photoUrl'],
    );
  }
}
