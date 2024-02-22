// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:spryzen/notification.dart';
//import 'package:timezone/timezone.dart' as tz;

class Reminder_Page extends StatefulWidget {
  const Reminder_Page({super.key});

  @override
  State<Reminder_Page> createState() => _Reminder_PageState();
}

class _Reminder_PageState extends State<Reminder_Page> {
  Notificationservices notificationservices = Notificationservices();
  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();
  TextEditingController textcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    notificationservices.initialiseNotifications();
    tz.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Reminder")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(80.0),
            child: Center(
              child: Form(
                child: Column(
                  children: [
                    const Text('Enter the text to be reminded'),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        controller: textcontroller,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(4),
                                right: Radius.circular(4)),
                          ),
                        )),
                    const SizedBox(height: 20),
                    const Text(" upload the voice"),
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Upload voice')),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(11)),
                          child: Center(
                            child: TextField(
                              controller: hourController,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          height: 40,
                          width: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              
                              borderRadius: BorderRadius.circular(11)),
                          child: Center(
                            child: TextField(
                              controller: minuteController,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        int hours;
                        int minutess;
                        hours = int.parse(hourController.text);
                        minutess = int.parse(minuteController.text);
                        TimeOfDay customTime = TimeOfDay(
                            hour: hours,
                            minute: minutess); // Customize this time
                        notificationservices.schedulenotificationAtTime(
                            'Notification', textcontroller.text, customTime);
                      },
                      child: const Text('Schedule reminder'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        notificationservices.stopnotification();
                      },
                      child: const Text('Stop notifications'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
