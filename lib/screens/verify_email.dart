import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Your Email"),
      ),
      body: Center(
        child: Column(children: [
          const Text(
              "We,ve sent you an email verification. Please open it to verify your account"),
          SizedBox(
            height: 30,
          ),
          const Text(
              "If you still haven't received the email verification. Click below to receive"),
          TextButton(
            onPressed: () async {},
            child: const Text("Send Verification Email"),
          ),
          TextButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.black)),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushNamedAndRemoveUntil(
                  context, 'loginpage', (route) => false);
            },
            child: const Text('Proceed to Login Screen'),
          ),
        ]),
      ),
    );
  }
}
