import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  Details({
    Key? key,
  }) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  TextEditingController _name = new TextEditingController();
  TextEditingController _dob = new TextEditingController();
  TextEditingController _gender = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 200,
      child: Column(
        children: [
          const Text(
            "Profile",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _name,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: "Name",
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _dob,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: "Date of Birth",
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _gender,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: "Gender",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
