import 'package:english_talk/Widgets/Containers.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class PremiumPageView extends StatelessWidget {
  const PremiumPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Premium Services",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Containers(
                  line1: "Connect by",
                  line2: "expected voice",
                  line3: "A definition of different",
                  line4: "language levels written",
                  line5: "by the Council of",
                  line6: "Europe",
                  image: AssetImage('assets/images/drawing1.png'),
                ),
                Containers(
                  line1: "",
                  line2: "Set expected voice",
                  line3: "A definition of different",
                  line4: "language levels written",
                  line5: "by the Council of",
                  line6: "Europe",
                  image: AssetImage('assets/images/drawing1.png'),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Containers(
                  line1: "",
                  line2: "Block advertisements",
                  line3: "A definition of different",
                  line4: "language levels written",
                  line5: "by the Council of",
                  line6: "Europe",
                  image: AssetImage('assets/images/drawing1.png'),
                ),
                Containers(
                  line1: "Release",
                  line2: "Temporary Block",
                  line3: "A definition of different",
                  line4: "language levels written",
                  line5: "by the Council of",
                  line6: "Europe",
                  image: AssetImage('assets/images/drawing1.png'),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Containers(
                  line1: "Unlimited Call ",
                  line2: "Duration",
                  line3: "A definition of different",
                  line4: "language levels written",
                  line5: "by the Council of",
                  line6: "Europe",
                  image: AssetImage('assets/images/drawing1.png'),
                ),
                Containers(
                  line1: "Reconnect ",
                  line2: "unlimited times",
                  line3: "A definition of different",
                  line4: "language levels written",
                  line5: "by the Council of",
                  line6: "Europe",
                  image: AssetImage('assets/images/drawing1.png'),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Containers(
                  line1: "How to",
                  line2: "Cancel Subscription",
                  line3: "A definition of different",
                  line4: "language levels written",
                  line5: "by the Council of",
                  line6: "Europe",
                  image: AssetImage('assets/images/drawing1.png'),
                ),
                Containers(
                  line1: "Upgrade to",
                  line2: "Premium Services",
                  line3: "A definition of different",
                  line4: "language levels written",
                  line5: "by the Council of",
                  line6: "Europe",
                  image: AssetImage('assets/images/drawing1.png'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
