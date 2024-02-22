// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:spryzen/screens/imagescreen.dart';
import 'package:spryzen/screens/setting_screen.dart';
import 'package:spryzen/screens/videoscreen.dart';
import 'package:spryzen/Remainder.dart';

class liste extends StatelessWidget {
  const liste({super.key});
  void newscreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return imagescreen();
    }));
  }

  void settingscreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return setting_screen();
    }));
  }

  void video(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return videoscreen();
    }));
  }

  void newscreenw(BuildContext cont) {
    Navigator.of(cont).push(MaterialPageRoute(builder: (_) {
      return const Reminder_Page();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.add_a_photo),
          title: Text(
            "Add photo",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer),
          ),
          onTap: () {
            newscreen(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.video_camera_front_rounded),
          title: Text(
            "Add video",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer),
          ),
          onTap: () => video(context),
        ),
        ListTile(
          leading: const Icon(Icons.alarm_add_rounded),
          title: Text(
            "Add remainder",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer),
          ),
          onTap: () {
            newscreenw(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: Text(
            "Settings",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer),
          ),
          onTap: () {
            settingscreen(context);
          },
        ),
      ],
    );
  }
}
