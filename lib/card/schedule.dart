import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  Map data = {};
  Map scheduleMap = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    scheduleMap.clear();

    if (data['schedule'] != null) scheduleMap = data['schedule'];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Select Schedule'),
        backgroundColor: Color(0xFF162749),
      ),
      body: Column(
        children: [
          Expanded(
              child: scheduleMap.length != 0
                  ? ListView.builder(
                      itemCount: scheduleMap.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            onTap: () {
                              Navigator.pop(context, {
                                'start': scheduleMap.keys.toList()[index],
                                'end': scheduleMap.values
                                    .toList()[index]
                                    .toString()
                                    .substring(0, 5),
                              });
                            },
                            title: Text(
                                'Start : ${scheduleMap.keys.toList()[index]}                                             End : ${scheduleMap.values.toList()[index].toString().substring(0, 5)}'),
                          ),
                        );
                      })
                  : ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(
                                'There is no available schedule for this work'),
                          ),
                        );
                      })),
        ],
      ),
    );
  }
}
