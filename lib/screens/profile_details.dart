import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:english_talk/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:english_talk/models/user.dart' as model;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  SharedPreferences prefs =
      SharedPreferences.getInstance() as SharedPreferences;
  String? get username => prefs.getString('username');
  String? get dob => prefs.getString('dob');
  String? get gender => prefs.getString('gender');

  @override
  void initState() {
    super.initState();
    print(username);
  }

  @override
  Widget build(BuildContext context) {
    // model.User? user = Provider.of<UserProvider>(context).getUser;
    return Positioned(
      top: 220,
      right: MediaQuery.of(context).size.width * 0.1,
      child: Container(
        height: 180,
        width: 350,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: AnimatedIconButton(
                    size: 40,
                    onPressed: () {},
                    duration: const Duration(milliseconds: 500),
                    splashColor: Colors.black,
                    icons: const <AnimatedIconItem>[
                      AnimatedIconItem(
                        icon: Icon(Icons.edit_outlined, color: Colors.white),
                      ),
                      AnimatedIconItem(
                        icon:
                            Icon(Icons.mode_edit_rounded, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              username!,
              style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              dob!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Text(
              gender!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
