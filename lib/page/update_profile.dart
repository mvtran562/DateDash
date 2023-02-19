import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:DateDash/model/user.dart';
import 'package:flutter/material.dart';
import 'package:DateDash/page/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class profileUpdate extends StatefulWidget {
  const profileUpdate({super.key});

  @override
  State<profileUpdate> createState() => _profileUpdate();
}

class _profileUpdate extends State<profileUpdate> {
  ImagePicker picker = ImagePicker();
  XFile? image;

  _getFromGallery() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      //update UI
    });
  }

  String userName = "";
  String userBio = "";
  String UserGreekAffil = "";
  String userGradYear = "";
  String userAge = "";
  String userMajor = "";
  String UserPhoneNum = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
          Text('Create a Profile', style: GoogleFonts.bebasNeue(fontSize: 52)),
          Text('Enter your name',
              style: GoogleFonts.bebasNeue(fontSize: 20, letterSpacing: 2)),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                      maxLines: 1,
                      maxLength: 30,
                      onChanged: ((value) => userName = value),
                      cursorColor: Colors.red,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Ex: Sally')))),
          Text('Short Bio',
              style: GoogleFonts.bebasNeue(fontSize: 20, letterSpacing: 2)),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                      maxLines: 1,
                      maxLength: 30,
                      onChanged: ((value) => userBio = value),
                      cursorColor: Colors.red,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Ex: I enjoy reading and Surfing')))),
          Text('Greek Life Affiliation',
              style: GoogleFonts.bebasNeue(fontSize: 20, letterSpacing: 2)),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                      maxLines: 1,
                      maxLength: 30,
                      onChanged: ((value) => UserGreekAffil = value),
                      cursorColor: Colors.red,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Ex: Alpha Phi, Theta Tau, Pike')))),
          Text('Graduation Year',
              style: GoogleFonts.bebasNeue(fontSize: 20, letterSpacing: 2)),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    maxLines: 1,
                    maxLength: 200,
                    onChanged: ((value) => userGradYear = value),
                    cursorColor: Colors.red,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Ex: 2025'),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ))),
          Text('Major',
              style: GoogleFonts.bebasNeue(fontSize: 20, letterSpacing: 2)),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                      maxLines: 1,
                      maxLength: 200,
                      onChanged: ((value) => userMajor = value),
                      cursorColor: Colors.red,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Ex: Ethnic Studies')))),
          Text('Age',
              style: GoogleFonts.bebasNeue(fontSize: 20, letterSpacing: 2)),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    maxLines: 1,
                    maxLength: 200,
                    onChanged: ((value) => userAge = value),
                    cursorColor: Colors.red,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Ex: 20'),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ))),
          Text('Phone Number',
              style: GoogleFonts.bebasNeue(fontSize: 20, letterSpacing: 2)),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    maxLines: 1,
                    maxLength: 200,
                    onChanged: ((value) => UserPhoneNum = value),
                    cursorColor: Colors.red,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Ex: XXX-XXX-XXXX'),
                    keyboardType: TextInputType.number,
                  ))),
          Text('Photo (you only get one so make it good)',
              style: GoogleFonts.bebasNeue(fontSize: 20, letterSpacing: 2)),
          MaterialButton(
              color: Colors.red,
              onPressed: () {
                _getFromGallery();
              },
              child: const Text("Upload")),
          MaterialButton(
              color: Colors.red,
              onPressed: () {
                //_getFromGallery();
                User newProfile = new User(
                    age: userAge,
                    bio: userBio,
                    gradYear: userGradYear,
                    greekAffil: UserGreekAffil,
                    major: userMajor,
                    name: userName,
                    phoneNumber: UserPhoneNum,
                    imgUrl: image!.path);
                Navigator.of(context).pop(newProfile);
              },
              child: const Text("SUBMIT"))
        ]))));
  }
}
