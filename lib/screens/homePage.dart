import 'package:english_talk/screens/loginPage.dart';
import 'package:english_talk/screens/profile_details.dart';
import 'package:english_talk/screens/radio_player.dart';
import 'package:flutter/material.dart';

import '../Widgets/Containers.dart';
import 'package:share_plus/share_plus.dart';
import '../services/auth_methods.dart';
import 'navbar.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    void logOut() async {
      await AuthMethods().logOut();
      setState(() {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      });
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(
            children: [
              SizedBox(
                height: 280,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/top.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              const Divider(
                thickness: 2,
                endIndent: 20,
                indent: 20,
              ),

              // MAIN ITEMS TO BE ADDED BELOW
              const SizedBox(
                height: 20,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Containers(
                    line1: "Talk to Level-1",
                    line2: "Speaker",
                    line3: "A definition of different",
                    line4: "language levels written",
                    line5: "by the Council of",
                    line6: "Europe",
                    image: AssetImage('assets/images/drawing1.png'),
                  ),
                  Containers(
                    line1: "Talk to Level-2",
                    line2: "Speaker",
                    line3: "A definition of different",
                    line4: "language levels written",
                    line5: "by the Council of",
                    line6: "Europe",
                    image: AssetImage('assets/images/drawing2.png'),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'premiumpage');
                    },
                    child: Containers(
                      line1: "Premium",
                      line2: "Services",
                      line3: "A definition of different",
                      line4: "language levels written",
                      line5: "by the Council of",
                      line6: "Europe",
                      image: AssetImage('assets/images/drawing1.png'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RadioPlay()));
                    },
                    child: Containers(
                      line1: "English Talk",
                      line2: "Radio",
                      line3: "A definition of different",
                      line4: "language levels written",
                      line5: "by the Council of",
                      line6: "Europe",
                      image: AssetImage('assets/images/drawing1.png'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Containers(
                    line1: "Debate &",
                    line2: "Discussion",
                    line3: "A definition of different",
                    line4: "language levels written",
                    line5: "by the Council of",
                    line6: "Europe",
                    image: AssetImage('assets/images/drawing3.png'),
                  ),
                  Containers(
                    line1: "Speak other",
                    line2: "Languages",
                    line3: "A definition of different",
                    line4: "language levels written",
                    line5: "by the Council of",
                    line6: "Europe",
                    image: AssetImage('assets/images/drawing1.png'),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'vocabularypage');
                    },
                    child: Containers(
                      line1: "Vocabulary &",
                      line2: "Grammer",
                      line3: "A definition of different",
                      line4: "language levels written",
                      line5: "by the Council of",
                      line6: "Europe",
                      image: AssetImage('assets/images/drawing1.png'),
                    ),
                  ),
                  Containers(
                    line1: "Re-connect",
                    line2: "Last Caller",
                    line3: "A definition of different",
                    line4: "language levels written",
                    line5: "by the Council of",
                    line6: "Europe",
                    image: AssetImage('assets/images/drawing4.png'),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Containers(
                    line1: "Set Your",
                    line2: "Ringtone",
                    line3: "A definition of different",
                    line4: "language levels written",
                    line5: "by the Council of",
                    line6: "Europe",
                    image: AssetImage('assets/images/drawing1.png'),
                  ),
                  Containers(
                    line1: "Privacy",
                    line2: "Policy",
                    line3: "A definition of different",
                    line4: "language levels written",
                    line5: "by the Council of",
                    line6: "Europe",
                    image: AssetImage('assets/images/drawing1.png'),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Containers(
                    line1: "Instructions &",
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
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 140,
                      height: 140,
                      child: Image(
                        image: AssetImage(
                          'assets/images/topped1.png',
                        ),
                      ),
                    ),
                    PopUpMen(
                      menuList: [
                        PopupMenuItem(
                          child: ListTile(
                            leading: Icon(
                              Icons.control_point_sharp,
                            ),
                            title: Text("Check your good user point"),
                          ),
                        ),
                        PopupMenuItem(
                          child: ListTile(
                            leading: Icon(
                              Icons.report,
                            ),
                            title: Text("Report against last caller"),
                          ),
                        ),
                        PopupMenuItem(
                          child: ListTile(
                            leading: Icon(
                              Icons.privacy_tip_outlined,
                            ),
                            title: Text("Privacy Policy"),
                          ),
                        ),
                        PopupMenuItem(
                          child: ListTile(
                            leading: Icon(
                              Icons.perm_device_info_rounded,
                            ),
                            title: Text("About Us"),
                          ),
                        ),
                        PopupMenuItem(
                          child: ListTile(
                            leading: Icon(
                              Icons.logout,
                            ),
                            title: GestureDetector(
                                onTap: logOut, child: Text("Log Out")),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
          ProfileDetails(),
          Positioned(
              top: 160,
              right: 160,
              child: Container(
                height: 120,
                width: 120,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
                child: const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/images/profilepic.jpeg'),
                ),
              )),
        ]),
      ),
    );
  }
}
