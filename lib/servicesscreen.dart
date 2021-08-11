import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'constants.dart';
import 'dart:math';

String stresslvl = 'No BPM detected';

class ServicesScreen extends StatelessWidget {
  final bpm = nextBPM(
      min: 60, max: 200); //minimum heart rate 60, maximum heart rate 200
  final temp = (Random().nextDouble() * 100).toStringAsFixed(2);
  //double temp = 0;

  createHeartRatePopup(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.brown.shade300,
                            Colors.red.shade200,
                            Colors.pink.shade300
                          ])),
                  child: Image(
                    image: AssetImage(
                        'images/kisspng-heart-rate-computer-icons-medicine-hospital-clip-a-heart-rate-icon-5b486825675d32.8314274315314719094234.png'),
                    alignment: Alignment.center,
                    color: Color.fromRGBO(0, 0, 0, 190),
                  ),
                ),
                Text(
                  '$bpm BPM',
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        radius: 14.0,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.close, color: Colors.blue),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  createTempPopup(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.purple.shade400,
                          Colors.purple.shade300,
                          Colors.pink.shade300
                        ]),
                  ),
                  child: Image(
                    image: AssetImage('images/thermometer-png-icon-17054.png'),
                    alignment: Alignment.center,
                    color: Color.fromRGBO(0, 0, 0, 198),
                  ),
                ),
                Text(
                  '$temp °C ',
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        radius: 14.0,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.close, color: Colors.blue),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  createStressPopup(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        colors: [
                          Colors.red.shade900,
                          Colors.red.shade600,
                          Colors.red.shade400,
                          Colors.red.shade500,
                          Colors.red.shade200
                        ]),
                  ),
                  child: Image(
                    image: AssetImage(
                        'images/kisspng-computer-icons-psychological-stress-emoticon-5ae50cd4ccf880.1913270215249604688396.png'),
                    alignment: Alignment.center,
                    color: Color.fromRGBO(0, 0, 0, 195),
                  ),
                ),
                Positioned(
                  top: 150,
                  child: Text('$stresslvl',
                      style: TextStyle(color: Colors.white, fontSize: 40),
                      textAlign: TextAlign.center),
                ),
                Positioned(
                  top: 200,
                  child: Text('$bpm BPM',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.center),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        radius: 14.0,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.close, color: Colors.blue),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  createServicesHelp(BuildContext context) {
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
              'This shows the BLE\ndevice’s services\navailable to you',
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
          'Services',
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
              Colors.teal,
              Colors.blue.shade600,
              Colors.blue.shade600,
              Colors.blue.shade600
            ])),
        child: Center(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                print('Open Heart Rate Pop up');
                                createHeartRatePopup(context);
                              },
                              child: Image(
                                image: AssetImage('images/Heart Rate Icon.png'),
                              ),
                            ),
                            Text(
                              'Heart Rate',
                              style: TextStyle(
                                  fontFamily: 'Ink Free',
                                  fontSize: 15,
                                  color: Colors.black87),
                            )
                          ],
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 30)),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                print('Open Temperature Pop up');
                                createTempPopup(context);
                              },
                              child: Image(
                                image:
                                    AssetImage('images/Thermometer icon.png'),
                              ),
                            ),
                            Text(
                              'Temperature',
                              style: TextStyle(
                                  fontFamily: 'Ink Free',
                                  fontSize: 15,
                                  color: Colors.black87),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ), // First Row of Icons
              Positioned(
                top: 240,
                left: 65,
                child: Row(
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print('Open Stress Icon');
                            if (60 < bpm && 101 > bpm) {
                              stresslvl = 'Calm';
                            } else if (100 < bpm && 131 > bpm) {
                              stresslvl = 'Stressed';
                            } else if (130 < bpm && 200 > bpm) {
                              stresslvl = 'Very Stressed';
                            }
                            createStressPopup(context);
                          },
                          child: Image(
                            image: AssetImage('images/Stress Icon.png'),
                          ),
                        ),
                        Text(
                          'Stress',
                          style: TextStyle(
                              fontFamily: 'Ink Free',
                              fontSize: 15,
                              color: Colors.black87),
                        )
                      ],
                    )
                  ],
                ),
              ), //2nd Row of Icons
              Positioned(
                bottom: 50,
                child: GestureDetector(
                  onTap: () {
                    print('Return to Main Menu');
                    Navigator.pop(context);
                  },
                  child: Image(
                    image: AssetImage('images/Disconnect.png'),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {
          print('Open About Dialog box');
          createServicesHelp(context);
        },
        child: Icon(Icons.help),
      ),
    );
  }
}

int nextBPM({required int min, required int max}) =>
    min + Random().nextInt(max - min + 1);

void choiceActions(String choice) {
  print('Opening Settings');
}
