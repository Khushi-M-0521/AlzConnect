// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../data.dart';

class Username extends StatelessWidget {
  Username(this.usernametitle, {super.key});

  final String usernametitle;
  String username = Data.getUsername();

  // void _username() {
  // setState() => TextField(
  //       expands: true,
  //     );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(usernametitle)),
      body: Column(
        children: [
          const Center(
            child: Icon(
              Icons.account_circle_rounded,
              size: 100,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle_rounded),
            title: const Text('Username'),
            subtitle: Text(username),
            //onTap:  _username,
          ),
        ],
      ),
    );
  }
}

