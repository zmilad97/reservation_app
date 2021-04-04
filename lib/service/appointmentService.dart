import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

String url = 'http://10.0.2.2:9090/api/';

void makeReserve(String token, String workId, String date ,String time) async {

  var reserve = {
    'work': {
      'id': workId,
    },
    'date': date,
    'time': time,
  };

  try {
    http.Response response = await http.post('${url}reserve/add',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': '$token'
        },
        body:jsonEncode(reserve));
    if (response.statusCode == 200) ;
  } catch (e) {
    print('Caught Error !!! : $e');
  }
}

Future<Map> searchWork(String title, String token) async {
  Map worksMap = {};
  List responselist;
  try {
    http.Response response = await http.get(
      '${url}work/search/$title',
      headers: {'Content-Type': 'application/json', 'Authorization': '$token'},
    );
    responselist = jsonDecode(response.body);
    responselist.forEach((element) {
      worksMap['${element['id']}'] = '${element['title']}';
    });
  } catch (e) {
    print('Caught Error !!! : $e');
    return null;
  }
  return worksMap;
}

Future<Map> findSchedule(String token, String workId, String weekDay) async {
  Map timeTable = {};
  try {
    http.Response response = await http
        .get('${url}schedule/weekday/$workId/$weekDay', headers: {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    });
    if (response.statusCode == 200) timeTable = jsonDecode(response.body);
  } catch (e) {
    print('Caught Error !!! : $e');
    return timeTable;
  }
  return timeTable;
}
