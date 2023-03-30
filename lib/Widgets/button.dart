import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Widget child;
  void Function() onPress;

  Button({
    required this.child,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 60,
      width: double.maxFinite,
      child: TextButton(
        onPressed: onPress,
        child: child,
        style: ButtonStyle(
          backgroundColor:
              MaterialStatePropertyAll<Color>(Colors.brown.shade300),
        ),
      ),
    );
  }
}

class Button1 extends StatelessWidget {
  Button1({Key? key, required this.icon, required this.onPress})
      : super(key: key);
  final IconData icon;
  void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.white),
        shape: MaterialStatePropertyAll<CircleBorder>(
            CircleBorder(side: BorderSide(color: Colors.black))),
      ),
      onPressed: onPress,
      child: Icon(
        icon,
        color: Colors.black,
        size: 70,
      ),
    );
  }
}
