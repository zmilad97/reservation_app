import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reservation_app/service/appointmentService.dart';

class Appointment extends StatefulWidget {
  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  Map data = {};
  Map appointment = {};

  // final work = TextEditingController();

  String button1 = 'Select Work';
  String button2 = 'Select Day';
  String button3 = 'Select Time';

  bool isSelectDayDisable = true;
  bool isSelectTimeDisable = true;

  final Decoration boxDec = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient: LinearGradient(colors: [Color(0xff84fab0), Color(0xff8fd3f4)]));

  Future<bool> selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: appointment['date'] == null || appointment['date'] == ''
          ? DateTime.now()
          : appointment['date'],
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year, DateTime.now().month + 1,
          DateTime.now().day - 1),
    );

    if (picked != null) {
      String formattedDateTime = DateFormat('yyyy-MM-dd').format(picked);
      appointment['date'] = DateFormat('yyyy-MM-dd').parse(formattedDateTime);
      return true;
    } else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Container(
      decoration:
          BoxDecoration(gradient: LinearGradient(end: Alignment.bottomRight,
              // focal: Alignment.centerRight,

              colors: [Color(0xFF2B5876), Color(0xFF4E4376)])),
      child: Scaffold(
        // Color(0xFF0D4204)
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_sharp,
              color: Colors.white,
            ),
          ),
          title: Text(
            'New Appointment',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF162749),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(
                        context, '/works',
                        arguments: {
                          'token': '${data['token']}',
                        });
                    if (appointment['date'] != null &&
                        appointment['date'] != '') {
                      appointment['date'] = '';
                      appointment['time'] = '';
                      button2 = 'Select Day';
                      button3 = 'Select Time';
                    }

                    if (result != null &&
                        '${result['workTitle']}' != null &&
                        '${result['workTitle']}' != '') {
                      appointment['workId'] = '${result['workId']}';
                      button1 = '${result['workTitle']}';
                      isSelectDayDisable = false;
                      setState(() {});
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(65.0, 0, 65, 0),
                    child: Container(
                      decoration: boxDec,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.work, color: Colors.black),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              button1,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87,
                                  letterSpacing: 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                TextButton(
                    //TODO : result should be a date from 30 free days from today
                    onPressed: () async {
                      if (!isSelectDayDisable && appointment.isNotEmpty) {
                        dynamic result = await selectDate(context);
                        if (result == true) {
                          isSelectTimeDisable = false;
                          button2 = '${appointment['date']}'.substring(0, 11);

                          if (appointment['time'] != null &&
                              appointment['time'] != '') {
                            appointment['time'] = '';
                          }
                        }
                      }
                      setState(() {});
                    },
                    // style: tButtonStyle,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(65, 0, 65, 0),
                      child: Container(
                        decoration: boxDec,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.today_outlined,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                button2,
                                style: TextStyle(
                                    fontSize: 20,
                                    letterSpacing: 1,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                SizedBox(height: 25),
                TextButton(
                  onPressed: () async {
                    Map schedule = {};
                    await findSchedule(
                            '${data['token']}',
                            '${appointment['workId']}',
                            '${DateFormat('EEEE').format(appointment['date']).toString().toUpperCase()}')
                        .asStream()
                        .forEach((e) {
                      schedule.addAll(e);
                    });

                    dynamic result = await Navigator.pushNamed(
                        context, '/schedule',
                        arguments: {
                          'schedule': schedule,
                        });
                    if (result != null && result != '') {
                      button3 = '${result['start']} - ${result['end']}';
                      appointment['time'] = result['start'];
                      setState(() {});
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(65.0, 0, 65, 0),
                    child: Container(
                      decoration: boxDec,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.schedule,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              button3,
                              style: TextStyle(
                                  fontSize: 20,
                                  letterSpacing: 1,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
                  onPressed: () {
                    submit();
                  },
                  child: Container(
                    width: 150,
                    height: 50,
                    child: Center(
                      child: Text(
                        'Submit'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 4,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void submit() {
    if (appointment['workId'] != null &&
        appointment['workId'] != '' &&
        appointment['date'] != null &&
        appointment['date'] != '' &&
        appointment['time'] != null &&
        appointment['time'] != '') {
      makeReserve(
          data['token'],
          '${appointment['workId']}',
          DateFormat('MM-dd-yyyy').format(appointment['date']),
          '${appointment['time']}');
    }
  }
}
