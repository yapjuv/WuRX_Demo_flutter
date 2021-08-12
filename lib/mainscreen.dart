import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wurx_demo/services.dart';
import 'package:wurx_demo/testtimer.dart';

class MainmenuiconslightmodeWidget extends StatelessWidget {
  createBLEDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: Colors.grey.shade800,
            title: const Text(
              'BLE Devices',
              style: TextStyle(color: Colors.white),
            ),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  print('Open WuRX Pop up 1');
                  Navigator.pop(context);
                },
                child: Text(
                  'Desktop xx-xx-xx\n00:00:01:03:95:A4',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  print('Open WuRX Pop up 2');
                  Navigator.pop(context);
                  createWuRXdialog(context);
                },
                child: Text(
                  'BLE Test Device\n00:00:01:03:95:A4',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        });
  }

  createWuRXdialog(BuildContext context) {
    TextEditingController wurxcontroller = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: Colors.grey.shade800,
            title: const Text(
              'Wake-up Address',
              style: TextStyle(color: Colors.white),
            ),
            content: TextField(
              decoration: InputDecoration(
                  fillColor: Colors.grey.shade300, filled: true),
              controller: wurxcontroller,
            ),
            actions: <Widget>[
              MaterialButton(
                onPressed: () {
                  print('Proceed to Services Screen');
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BLEServices()));
                },
                elevation: 5.0,
                child: Text(
                  'Connect',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.blue.shade600,
              Colors.teal,
              Colors.blue.shade600,
              Colors.blue.shade600,
              Colors.blue.shade600
            ])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(padding: EdgeInsets.only(top: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(image: AssetImage('images/Analog_devices_logo1.png'))
                ],
              ), //row for logo
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'WuRX Demo',
                    style: TextStyle(
                        fontFamily: 'Ink Free',
                        fontSize: 50,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ), //row for app name
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              debugPrint('Show BLE Devices');
                              createBLEDialog(context);
                            },
                            child: Image.asset('images/BLE icon.png'),
                          ),
                          Text(
                            'BLE',
                            style:
                                TextStyle(fontFamily: 'Ink Free', fontSize: 15),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 30)),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TestTimerScreen()));
                              debugPrint('Navigate to Test Timer Screen');
                            },
                            child: Image.asset('images/Timer icon.png'),
                          ),
                          Text(
                            'Test Timer',
                            style:
                                TextStyle(fontFamily: 'Ink Free', fontSize: 15),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '© Analog Devices, 2021\nAll Rights Reserved',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Scope One',
                      color: Color.fromRGBO(11, 0, 0, 1),
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1,
                      fontSize: 15,
                    ),
                  )
                ],
              ) //Row for copyrights
            ],
          ),
        ),
      )),
    );
  }
}
