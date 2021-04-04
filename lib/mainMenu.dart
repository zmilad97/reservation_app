import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    var cColor = 0xff453658;

    return Flexible(
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: EdgeInsets.only(left: 16, right: 16),
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: myList.map((e) {
          return Container(
            decoration: BoxDecoration(
                color: Color(cColor), borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(e.icon),
                SizedBox(
                  height: 14,
                ),
                Text(
                  e.title,
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class Items {
  String title;

  IconData icon;

  Items(this.title, this.icon);
}

Items item1 = new Items('New Appointment', Icons.add_alert);
Items item2 = new Items('All Works', Icons.work);
Items item3 = new Items('My Appointments', Icons.assignment_outlined);
Items item4 = new Items('Another button', Icons.smart_button);
Items item5 = new Items('Another button', Icons.wine_bar_rounded);
Items item6 = new Items('Another button', Icons.wrong_location_outlined);
