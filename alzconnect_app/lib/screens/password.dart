// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:spryzen/screens/setting_screen.dart';

import '../data.dart';

class Password extends StatefulWidget {
  const Password(this.Passwordtitle, {super.key});
  final String Passwordtitle;

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool is_visibility = false;
  bool is_visibility2 = false;
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirm = TextEditingController();
  final TextEditingController _newpassword = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _password.dispose();
    _newpassword.dispose();
    _confirm.dispose();
    super.dispose();
  }

  void newscre(BuildContext ctxxx) {
    Navigator.of(ctxxx).push(
      MaterialPageRoute(
        builder: (_) {
          return setting_screen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        appBar: AppBar(title: Text(widget.Passwordtitle)),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.all(10)),
                  const Padding(padding: EdgeInsets.all(10)),
                  const Text('Enter the new password'),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _newpassword,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 8) {
                        return "Enter correct password with minimum 8 characters";
                      } else {
                        return null;
                      }
                    },
                    obscureText: !is_visibility,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.password_outlined),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              is_visibility = !is_visibility;
                            });
                          },
                          icon: is_visibility
                              ? const Icon(
                                  Icons.visibility,
                                  color: Colors.blue,
                                )
                              : const Icon(
                                  Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                        ),
                        contentPadding: const EdgeInsets.all(15),
                        border:const  OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(),
                        )),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  const Text('Confirm the password'),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _confirm,
                    validator: (value) {
                      if (value!.isEmpty || value != _newpassword.text) {
                        return "password mismatch";
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
                              ?const  Icon(
                                  Icons.visibility,
                                  color: Colors.blue,
                                )
                              :const  Icon(
                                  Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                        ),
                        contentPadding:const  EdgeInsets.all(15),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(),
                        )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          Data.changePwd(_confirm.text);
                          newscre(context);
                          const snackBar = SnackBar(
                            content: Text('Password Changed'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: const Text('Submit')),
                ],
              ),
            ),
          ),
        ));
  }
}
