import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_talk/screens/homePage.dart';
import 'package:english_talk/screens/signupPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Widgets/button.dart';
import '../Widgets/disclaimer.dart';
import '../Widgets/textFieldd.dart';
import '../Widgets/utils.dart';
import '../services/auth_methods.dart';
import '../services/show_error_dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
      email: _email.text,
      password: _password.text,
    );

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
              height: 50,
            ),
            Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.8,
                child: const Image(
                  image: AssetImage('assets/images/main.png'),
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: 30,
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
              hintText: 'Password',
              obscureText: true,
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
                  : const Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
              onPress: loginUser,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Don't have an account?",
              style: TextStyle(fontSize: 16),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignupPage()));
              },
              child: const Text(
                "Sign up",
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
