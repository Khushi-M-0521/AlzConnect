// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'dart:convert';
//import 'dart:io' as Io;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:video_player/video_player.dart';
import 'package:spryzen/app_bar.dart';
//import 'package:spryzen/screens/mainscreen.dart';

import '../data.dart';

class videoscreen extends StatefulWidget {
  const videoscreen({super.key});

  @override
  _videoscreenState createState() => _videoscreenState();
}

class _videoscreenState extends State<videoscreen> {
  //XFile? _videoFile;
  final _picker = ImagePicker();
  _pickImagebase() async {
    final video = await _picker.pickVideo(source: ImageSource.gallery);
    if (video == null) return;
    Uint8List videobyte = await video.readAsBytes();
    String base64 = base64Encode(videobyte);
    //print(base64);
    bool videos = await Data.insertVideo(base64);
    if (videos) {
      //print("imagestored");
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text("Video picker"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            _pickImagebase();
            newscreen(context);
          },
          child: const Text("PICK FROM GALLERY"),
        ),
        Container(
          height: 40.0,
        ),
      ],
        ),
      ),
    );
  }

  void newscreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return APPBAR();
    }));
  }
}
