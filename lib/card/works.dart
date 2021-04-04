import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:reservation_app/service/appointmentService.dart';

class WorksCard extends StatefulWidget {
  @override
  _WorksCardState createState() => _WorksCardState();
}

class _WorksCardState extends State<WorksCard> {
  Map worksMap = {};
  Map data = {};

  // Map worksMap = {12: 'test 1', 22: 'test 2', 32: 'test 3'};

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Work',
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF162749),
      ),
      body: Column(
        children: [
          Container(
            color: Color(0xFF162749),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 7.5, 10, 7.5),
              child: Card(
                child: ListTile(
                  onTap: () {},
                  title: new TextField(
                    controller: controller,
                    decoration: new InputDecoration(
                        hintText: 'Search', border: InputBorder.none),
                    //TODO : fix here (open in a new window then search -> then loading-> then show)
                  ),
                  leading: IconButton(
                    onPressed: () {
                      searchTextBox('${controller.text}');
                    },
                    icon: Icon(Icons.search),
                  ),
                  trailing: new IconButton(
                      icon: new Icon(Icons.cancel),
                      onPressed: () {
                        controller.clear();
                      }),
                ),
              ),
            ),
          ),
          Expanded(
              child: worksMap.length != 0
                  ? ListView.builder(
                      itemCount: worksMap.length,
                      itemBuilder: (context, index) {
                        return FocusedMenuHolder(
                          onPressed: () {},
                          menuItems: <FocusedMenuItem>[
                            FocusedMenuItem(
                              title: Text('Details'),
                              trailingIcon: Icon(Icons.info_outline),
                              onPressed: () {
                                Navigator.pushNamed(context, '/workDetails');
                              },
                            ),
                            FocusedMenuItem(
                              title: Text('Address'),
                              trailingIcon: Icon(Icons.map),
                              //TODO : make this method to navigate to google map and shows address on it
                              onPressed: () {
                                // Navigator.pushNamed(context, '/work-address-on-map',arguments: {});
                              },
                            ),
                            FocusedMenuItem(
                                title: Text(
                                  'Dismiss',
                                  style: TextStyle(color: Colors.red),
                                ),
                                trailingIcon: Icon(
                                  Icons.cancel_outlined,
                                  color: Colors.red,
                                ),
                                onPressed: () {}),
                          ],
                          child: Card(
                            child: ListTile(
                              title: Text('${worksMap.values.toList()[index]}'),
                              onTap: () {
                                Navigator.pop(context, {
                                  'workId': worksMap.keys.toList()[index],
                                  'workTitle': worksMap.values.toList()[index],
                                });
                              },
                            ),
                          ),
                        );
                      })
                  : ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text('Use Search To Find WorkPlaces'),
                          ),
                        );
                      },
                    ))
        ],
      ),
    );
  }

  void searchTextBox(String title) async {
    Map result = await searchWork(title, '${data['token']}');
    worksMap = result;
    setState(() {});
  }
}
