import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_talk/Widgets/textFieldd.dart';
import 'package:english_talk/Widgets/utils.dart';
import 'package:english_talk/screens/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Widgets/button.dart';
import '../Widgets/disclaimer.dart';
import '../services/auth_methods.dart';
import '../services/show_error_dialog.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _username.dispose();
    _gender.dispose();
    _dob.dispose();
    super.dispose();
  }

  void selectImage() async {
    Uint8List image = await pickImage(ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
        email: _email.text,
        password: _password.text,
        username: _username.text,
        dob: _dob.text,
        gender: _gender.text,
        file: _image!);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', _username.text);
    prefs.setString('email', _email.text);
    prefs.setString('dob', _dob.text);
    prefs.setString('gender', _gender.text);

    setState(() {
      _isLoading = false;
    });

    if (res != "success") {
      showSnackBar(res, context);
    } else {
      showSnackBar(res, context);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.6,
                child: const Image(
                  image: AssetImage('assets/images/talk1.png'),
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 64,
                        backgroundImage: MemoryImage(_image!),
                      )
                    : CircleAvatar(
                        radius: 64,
                        backgroundImage: NetworkImage(
                            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                      ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: selectImage,
                    icon: const Icon(
                      Icons.add_a_photo,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextFieldd(
              controller: _username,
              hintText: 'Name',
              obscureText: false,
              keyboard: TextInputType.name,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFieldd(
              controller: _email,
              hintText: 'Email',
              obscureText: false,
              keyboard: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFieldd(
              controller: _password,
              hintText: 'Set Password',
              obscureText: false,
              keyboard: TextInputType.visiblePassword,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFieldd(
              controller: _dob,
              hintText: 'Date of Birth ( DD/MM/YY)',
              obscureText: false,
              keyboard: TextInputType.datetime,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFieldd(
              controller: _gender,
              hintText: 'Gender',
              obscureText: false,
              keyboard: TextInputType.text,
            ),
            const SizedBox(
              height: 30,
            ),
            Button(
              child: _isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      "Register",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
              onPress: signUpUser,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Already have an account ?",
              style: TextStyle(fontSize: 16),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Log in",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.grey[100],
              height: 160,
              child: Column(
                children: [
                  Container(
                    height: 62,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/line.png'),
                      ),
                    ),
                  ),
                  const Disclaimer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
