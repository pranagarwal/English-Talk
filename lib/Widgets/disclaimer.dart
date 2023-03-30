import 'package:flutter/material.dart';

class Disclaimer extends StatelessWidget {
  const Disclaimer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'By continuing, you agree with ',
              style: TextStyle(fontSize: 17),
            ),
            Text(
              'Terms and',
              style: TextStyle(fontSize: 17, color: Colors.grey),
            ),
          ],
        ),
        SizedBox(
          height: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Conditions, Privacy Policy, Safety ',
              style: TextStyle(fontSize: 17, color: Colors.grey),
            ),
            Text(
              'and',
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
        Text(
          'Community Guidelines.',
          style: TextStyle(fontSize: 17, color: Colors.grey),
        ),
      ],
    );
  }
}
