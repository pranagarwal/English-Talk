import 'package:flutter/material.dart';

class Containers extends StatelessWidget {
  Containers({
    required this.line1,
    required this.line2,
    required this.line3,
    required this.line4,
    required this.line5,
    required this.line6,
    required this.image,
  });

  final String line1;
  final String line2;
  final String line3;
  final String line4;
  final String line5;
  final String line6;
  final AssetImage image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      height: 230,
      width: MediaQuery.of(context).size.width * 0.43,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.grey.shade200, Colors.white]),
      ),
      child: Column(
        children: [
          Expanded(child: Image(width: 220, image: image)),
          Container(
            width: MediaQuery.of(context).size.width * 0.43,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  line1,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  line2,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  line3,
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  line4,
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  line5,
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  line6,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
