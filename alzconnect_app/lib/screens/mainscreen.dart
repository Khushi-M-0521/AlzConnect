//import 'package:cross_file/src/types/interface.dart';
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:spryzen/image_get.dart';

//import 'package:spryzen/screens/imagescreen.dart';
//import 'package:spryzen/video_get.dart';

class mainscreen extends StatefulWidget {
  const mainscreen({super.key});

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: imageget(),
      ),
    );
  }
}
