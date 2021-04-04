// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reservation_app/card/schedule.dart';
import 'package:reservation_app/card/works.dart';
import 'package:reservation_app/first-page/first-page.dart';
import 'package:reservation_app/home.dart';
import 'package:reservation_app/loading.dart';
import 'package:reservation_app/menu-pages/newAppointment.dart';
import 'package:reservation_app/model/workDetailsPage.dart';

import 'first-page/login.dart';
import 'model/workAddressOnMap.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(MaterialApp(
    initialRoute: '/first-page',
    title: 'Reservation App',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: GoogleFonts.muktaVaaniTextTheme(),
    ),
    debugShowCheckedModeBanner: false,
    routes: {
      '/first-page': (context) => FirstPage(),
      '/login': (context) => Login(),
      '/loading': (context) => Loading(),
      '/home': (context) => Home(),
      '/newAppointment': (context) => Appointment(),
      '/works': (context) => WorksCard(),
      '/workDetails': (context) => WorkDetails(),
      '/schedule': (context) => Schedule(),
      // '/work-address-on-map' :(context) => WorkAddress(),
    },
  ));
}
