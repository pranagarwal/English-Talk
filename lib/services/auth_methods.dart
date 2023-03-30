import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_talk/services/storage_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:english_talk/models/user.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentuser = _auth.currentUser!;

    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentuser.uid)
        .get();
    return model.User.fromSnap(snap);
  }

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String dob,
    required String gender,
    required Uint8List file,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          dob.isNotEmpty &&
          gender.isNotEmpty &&
          file != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage("profilePics", file, false);

        // adding user to database
        model.User user = model.User(
          email: email,
          username: username,
          uid: cred.user!.uid,
          dob: dob,
          gender: gender,
          photoUrl: photoUrl,
        );

        var dataa = await _firestore
            .collection("users")
            .doc(cred.user!.uid)
            .set(user.toJson());
        
        res = "success";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  logOut() async {
    await _auth.signOut();
  }
}
