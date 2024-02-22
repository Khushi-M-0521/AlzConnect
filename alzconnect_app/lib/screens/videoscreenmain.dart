//import 'package:cross_file/src/types/interface.dart';
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
//import 'package:spryzen/image_get.dart';

//import 'package:spryzen/screens/imagescreen.dart';
import 'package:spryzen/video.dart';
//import 'package:spryzen/video_get.dart';

class mainvideoscreen extends StatefulWidget {
  const mainvideoscreen({super.key});

  @override
  State<mainvideoscreen> createState() => _mainvideoscreenState();
}

class _mainvideoscreenState extends State<mainvideoscreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: VideoPlayerScreen(),
      ),
    );
  }
}
