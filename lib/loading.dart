
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'model/user.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Map data = {};

  void authorizeUser() async {
    User user =
        User(username: '${data['username']}', password: '${data['password']}');
    http.Response response = await user.authorize();
    // print('${response.headers['authorization']}');
    if (response == null) {
      //TODO : uncomment and fix Here to /login after creating home
      // TODO :and change the background color of alert
      Navigator.pushReplacementNamed(context, "/home");
      // await Alert(
      //   context: context,
      //   type: AlertType.warning,
      //   style: AlertStyle(
      //     animationType: AnimationType.grow,
      //     isCloseButton: false,
      //     isOverlayTapDismiss: false,
      //     descStyle: TextStyle(fontWeight: FontWeight.bold),
      //     descTextAlign: TextAlign.start,
      //     animationDuration: Duration(milliseconds: 400),
      //     alertBorder: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(0.0),
      //       side: BorderSide(
      //         color: Colors.grey,
      //       ),
      //     ),
      //     titleStyle: TextStyle(
      //       color: Colors.red,
      //     ),
      //     alertAlignment: Alignment.center,
      //   ),
      //   title: "Connection Problem",
      //   desc: "Check your internet connection or try later",
      //   buttons: [
      //     DialogButton(
      //       child: Text(
      //         "Ok",
      //         style: TextStyle(color: Colors.white, fontSize: 20),
      //       ),
      //
      //       onPressed: () => Navigator.pushReplacementNamed(context, "/login"),
      //       width: 120,
      //     )
      //   ],
      // ).show();
    } else {
      if (response.statusCode == 200){
        Map<String,String> headers = response.headers;
        Navigator.pushReplacementNamed(context, "/home",arguments: {
          'token' : '${headers['authorization']}',
        });
      }
      else {
        Alert(
          context: context,
          type: AlertType.warning,
          style: AlertStyle(
            animationType: AnimationType.grow,
            isCloseButton: false,
            isOverlayTapDismiss: false,
            descStyle: TextStyle(fontWeight: FontWeight.bold),
            descTextAlign: TextAlign.start,
            animationDuration: Duration(milliseconds: 400),
            alertBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: BorderSide(
                color: Colors.grey,
              ),
            ),
            titleStyle: TextStyle(
              color: Colors.red,
            ),
            alertAlignment: Alignment.center,
          ),
          title: "Invalid Credentials",
          desc: "Phone Number or Password is Wrong ",
          buttons: [
            DialogButton(
              child: Text(
                "Ok",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, "/login"),
              width: 120,
            )
          ],
        ).show();
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    authorizeUser();
    return Scaffold(
      backgroundColor: Color(0xFF00051C),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Signing in ...',
            style: TextStyle(
              color: Colors.yellow,
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 45,
          ),
          Center(
            child: SpinKitFadingCube(
              color: Colors.white,
              size: 50.0,
            ),
          ),
        ],
      ),
    );
  }
}
