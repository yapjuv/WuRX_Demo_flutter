import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'constants.dart';
import 'dart:async';

class TestTimerScreen extends StatefulWidget {
  @override
  _testtimerscreen createState() => _testtimerscreen();
}

class _testtimerscreen extends State<TestTimerScreen> {
  int minuto = 30;
  int segundo = 00;
  int mills = 000;
  //int sectest = 10000;

  Timer? _timer;

  /*void testTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 1), (timer) {
      setState(() {
        sectest--;
      });
    });
  }*/

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 1), (timer) {
      setState(() {
        if (mills == 0 && segundo == 0 && minuto == 0) {
          _stopTimer();
        } else {
          if (mills == 0) {
            if (segundo <= 0) {
              if (minuto <= 0) {
                _stopTimer();
              } else {
                minuto--;
              }
              segundo = 59;
            } else {
              segundo--;
            }
            mills = 999;
          } else {
            mills--;
          }
        }
        print('$minuto:$segundo.$mills');
      });
    });
  }

  void _stopTimer() {
    setState(() {
      minuto = 30;
      segundo = 00;
      mills = 000;
      _timer?.cancel();
    });
  }

  createTestTimerHelp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            title: Text(
              'About',
              style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
            ),
            content: Text(
              'Tests if system\ntimer is working\nproperly.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
            ),
            actions: <Widget>[
              GestureDetector(
                onTap: () {
                  print('Close About');
                  Navigator.pop(context);
                },
                child: Image(
                  image: AssetImage('images/OkButton.png'),
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Test Timer',
          style: TextStyle(
              fontFamily: 'Ink Free', fontSize: 40, color: Colors.black87),
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            color: Colors.grey.shade800,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            onSelected: choiceActions,
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                    value: choice,
                    child: Text(
                      choice,
                      style: TextStyle(color: Colors.white),
                    ));
              }).toList();
            },
          )
        ],
        bottom: PreferredSize(
          child: Container(
            color: Colors.black87,
            height: 2.0,
          ),
          preferredSize: Size.fromHeight(2.0),
        ),
      ),
      body: Center(
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.blue.shade600,
                    Colors.blue.shade600,
                    Colors.teal,
                    Colors.blue.shade600,
                    Colors.blue.shade600
                  ])),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  /*Positioned(
                    top: 190,
                    child: Text('$sectest',
                        style: TextStyle(
                          fontSize: 40,
                        )),
                  ),*/
                  Positioned(
                      top: 260,
                      child: Image(
                        image: AssetImage('images/timerbg.png'),
                      )), //background of timer
                  Positioned(
                    top: 280,
                    child: Text('$minuto:$segundo.$mills',
                        style: TextStyle(
                            color: Colors.greenAccent.shade700,
                            fontFamily: 'Digital-7',
                            fontSize: 50)),
                  ), //Text timer
                  Positioned(
                      top: 360,
                      child: GestureDetector(
                        onTap: () {
                          print('Start Timer');
                          //testTimer();
                          _startTimer();
                        },
                        child: Image(
                          image: AssetImage('images/Start Button.png'),
                        ),
                      )), //start button
                  Positioned(
                      top: 440,
                      child: GestureDetector(
                        onTap: () {
                          print('Reset Timer');
                          _stopTimer();
                        },
                        child: Image(
                          image: AssetImage('images/Reset Button.png'),
                        ),
                      )) //reset button
                ],
              ))),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {
          print('Open About Dialog box');
          createTestTimerHelp(context);
        },
        child: Icon(Icons.help),
      ),
    );
  }
}

void choiceActions(String choice) {
  print('Opening Settings');
}
