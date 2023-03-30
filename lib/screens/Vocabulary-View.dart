import 'package:english_talk/Widgets/Containers.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class VocabularyView extends StatelessWidget {
  const VocabularyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Vocabulary & Grammer",
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
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'basicVocab'),
                  child: Containers(
                    line1: "",
                    line2: "Basic Vocabulary",
                    line3: "A definition of different",
                    line4: "language levels written",
                    line5: "by the Council of",
                    line6: "Europe",
                    image: AssetImage('assets/images/drawing1.png'),
                  ),
                ),
                Containers(
                  line1: "",
                  line2: "Advanced Vocalbulary",
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
                  line2: "Phrasal Vocabulary",
                  line3: "A definition of different",
                  line4: "language levels written",
                  line5: "by the Council of",
                  line6: "Europe",
                  image: AssetImage('assets/images/drawing1.png'),
                ),
                Containers(
                  line1: "",
                  line2: "Popular Idioms",
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
                  line1: "Applied Grammer",
                  line2: "Manual",
                  line3: "A definition of different",
                  line4: "language levels written",
                  line5: "by the Council of",
                  line6: "Europe",
                  image: AssetImage('assets/images/drawing1.png'),
                ),
                GestureDetector(
                  onTap: () {
                    Share.share('com.example.english_talk');
                  },
                  child: Containers(
                    line1: "",
                    line2: "Share App ",
                    line3: "A definition of different",
                    line4: "language levels written",
                    line5: "by the Council of",
                    line6: "Europe",
                    image: AssetImage('assets/images/drawing1.png'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
