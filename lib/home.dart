import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFF3B4D61),
      appBar: AppBar(
        title: Text('Main Menu'),
        centerTitle: true,
        backgroundColor: Color(0xFF162749),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 40, 0, 0),
                child: Column(
                  children: [
                    FlatButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      minWidth: 150,
                      height: 150,
                      onPressed: () {
                        Navigator.pushNamed(context, "/newAppointment",
                            arguments: {
                              'token': '${data['token']}',
                            });
                      },
                      color: Colors.white,
                      child: Column(
                        children: [
                          Icon(
                            Icons.add_alert_sharp,
                            size: 50,
                            color: Colors.blue[900],
                          ),
                          Text('New Appointment')
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      minWidth: 150,
                      height: 150,
                      onPressed: () {},
                      color: Colors.white,
                      child: Column(
                        children: [
                          Icon(
                            Icons.assignment_outlined,
                            size: 50,
                            color: Colors.blue[900],
                          ),
                          Text('My Appointments')
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      minWidth: 150,
                      height: 150,
                      onPressed: () {},
                      color: Colors.white,
                      child: Column(
                        children: [
                          Icon(
                            Icons.assignment_outlined,
                            size: 50,
                            color: Colors.blue[900],
                          ),
                          Text('My Appointments')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(

                padding: const EdgeInsets.fromLTRB(15, 40, 0, 0),
                child: Column(
                  children: [
                    FlatButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

                      minWidth: 150,
                      height: 150,
                      onPressed: () {},
                      color: Colors.white,
                      child: Column(
                        children: [
                          Icon(
                            Icons.work,
                            size: 50,
                            color: Colors.blue[900],
                          ),
                          Text('All Works')
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      minWidth: 150,
                      height: 150,
                      onPressed: () {},
                      color: Colors.white,
                      child: Column(
                        children: [
                          Icon(
                            Icons.assignment_outlined,
                            size: 50,
                            color: Colors.blue[900],
                          ),
                          Text('My Appointments')
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      minWidth: 150,
                      height: 150,
                      onPressed: () {
                      },
                      color: Colors.white,
                      child: Column(
                        children: [
                          Icon(
                            Icons.assignment_outlined,
                            size: 50,
                            color: Colors.blue[900],
                          ),
                          Text('My Appointments')
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
