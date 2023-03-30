import 'package:flutter/material.dart';

class BasicVocab extends StatefulWidget {
  const BasicVocab({super.key});

  @override
  State<BasicVocab> createState() => _BasicVocabState();
}

class _BasicVocabState extends State<BasicVocab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Basic Vocabulary",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Choose your Level",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const Divider(),
                const SizedBox(
                  height: 5,
                ),
                for (int i = 1; i <= 15; i++)
                  ElevatedButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 190)),
                      ),
                      child: Text(
                        "Level $i",
                        style: TextStyle(color: Colors.black),
                      )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
