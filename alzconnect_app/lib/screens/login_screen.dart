// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:spryzen/app_bar.dart';
//import 'package:spryzen/screens/mainscreen.dart';
import 'package:spryzen/screens/signupscreen.dart';

import '../data.dart';

class Log_in extends StatefulWidget {
  const Log_in({super.key});

  @override
  State<Log_in> createState() => _Log_inState();
}

class _Log_inState extends State<Log_in> {
  bool is_visibility = false;
  bool is_visibility2 = false;
  //String _name = "";
  final TextEditingController _usernamee = TextEditingController();
  final TextEditingController _passwordd = TextEditingController();
  final formkey = GlobalKey<FormState>();
  
  @override
  void dispose() {
    _usernamee.dispose();
    _passwordd.dispose();
    super.dispose();
  }

  void settings(BuildContext ctxxxxx) {
    Navigator.of(ctxxxxx).push(
      MaterialPageRoute(
        builder: (_) {
          return const APPBAR();
        },
      ),
    );
  }

  void newsr(BuildContext ctxxxxx) {
    Navigator.of(ctxxxxx).push(
      MaterialPageRoute(
        builder: (_) {
          return const Sign_up();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SingleChildScrollView(
          child: Form(
              key: formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _usernamee,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter the correct username";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.account_circle_outlined),
                      contentPadding: EdgeInsets.all(15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(4),
                            right: Radius.circular(4)),
                      ),
                      hintText: "Username",
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  TextFormField(
                    controller: _passwordd,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password invalid";
                      } else {
                        return null;
                      }
                    },
                    obscureText: !is_visibility2,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.password_outlined),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            is_visibility2 = !is_visibility2;
                          });
                        },
                        icon: is_visibility2
                            ? const Icon(
                                Icons.visibility,
                                color: Colors.blue,
                              )
                            : const Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              ),
                      ),
                      contentPadding:const  EdgeInsets.all(15),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(4),
                            right: Radius.circular(4)),
                      ),
                      hintText: "Password",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        String username = _usernamee.text.toString();
                        String password = _passwordd.text.toString();
                        if (formkey.currentState!.validate() &&
                            await Data.login(username, password)) {
                          // ignore: use_build_context_synchronously
                          settings(context);
                        }
                      },
                      child: const Text("Login")),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text("If u dont have an account"),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () => newsr(context), child: const Text("SignUp")),
                ],
              )),
        ),
      ),
    ));
  }
}
