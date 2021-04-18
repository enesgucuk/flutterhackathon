import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:ui';
import 'dart:math';

import 'package:google_project/anasayfa.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentNum = 1;
  int skor = 0;
  int test;
  int can = 5;
  var cancik = 5;
  bool isStarted = false;
  int times = 1000;
  var kalps = <Widget>[
    Image.asset(
      "lib/images/heart.png",
      height: 40,
      width: 40,
    ),
    Image.asset(
      "lib/images/heart.png",
      height: 40,
      width: 40,
    ),
    Image.asset(
      "lib/images/heart.png",
      height: 40,
      width: 40,
    ),
    Image.asset(
      "lib/images/heart.png",
      height: 40,
      width: 40,
    ),
    Image.asset(
      "lib/images/heart.png",
      height: 40,
      width: 40,
    ),
  ];
  Random random = Random();
  var fonk = Timer(Duration(milliseconds: 0), () => null);
  var fonk2 = Timer(Duration(milliseconds: 0), () => null);
  var fonk3 = Timer(Duration(milliseconds: 0), () => null);
  bool isTapped = false;
  var gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(82, 194, 52, 100),
        Color.fromRGBO(82, 194, 52, 70)
      ]);

  void sureHiz() {
    fonk3 = Timer.periodic(Duration(seconds: 10), (timer) {
      setState(() {
        print("YENİLENDİ");
        times -= 100;
        fonk.cancel();
        randomNum();
        fonk2.cancel();
        endGame();
      });
    });
  }

  void endGame() {
    fonk2 = Timer.periodic(Duration(milliseconds: times), (time) {
      setState(() {
        can--;
        if (can != cancik) {
          cancik--;
          kalps.removeLast();
        }
        print("$can");
        if (can == 0) {
          fonk3.cancel();
          fonk2.cancel();
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Center(child: Text("TEŞEKKÜRLER")),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Center(child: Text('DESTEK VERDİĞİN İÇİN ÇOK MUTLUYUZ')),
                        Center(child: Text("TOPLADIĞIN ÇÖP: $skor")),
                        Center(child: Text("İstersen reklam izleyerek de destek olabilirsin.")),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Yeniden Dene"),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyHomePage()));
                      },
                    ),
                    FlatButton(
                      child: Text("Reklam İzle"),
                      onPressed: () {
                        Fluttertoast.showToast(
                            msg: " Desteğin için Teşekkürler!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      },
                    ),
                  ],
                );
              });
          fonk.cancel();
          fonk2.cancel();
        }
      });
    });
  }

  void alerts() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text("TEŞEKKÜRLER")),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Center(child: Text('DESTEK VERDİĞİN İÇİN ÇOK MUTLUYUZ')),
                  Center(child: Text("TOPLADIĞIN ÇÖP: $skor")),
                  Center(child: Text("İstersen reklam izleyerek de destek olabilirsin.")),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Yeniden Dene"),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                },
              ),
              FlatButton(
                child: Text("Reklam İzle"),
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: " Desteğin için Teşekkürler!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                },
              ),
            ],
          );
        });
    fonk.cancel();
    fonk2.cancel();
    fonk3.cancel();
  }

  void skorArtir() {
    skor++;
    can++;
  }

  void randomNum() {
    fonk = Timer.periodic(Duration(milliseconds: times), (timer) {
      isTapped=false;
      test = random.nextInt(9);
      if (currentNum == test) {
        if (currentNum == 8) {
          setState(() {
            currentNum--;
          });
        } else {
          setState(() {
            currentNum++;
          });
        }
      } else {
        setState(() {
          currentNum = test;
        });
      }
      print("Anlık index: $currentNum");
    });
  }

  @override
  void initState() {
    super.initState();

    //canKontrol(can);
  }

  @override
  dispose() {
    fonk.cancel();
    fonk2.cancel();
    fonk3.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: gradient),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: isStarted == false
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        endGame();
                        randomNum();
                        sureHiz();
                        isStarted = true;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Anasayfa()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Center(
                                child: Text(
                                  "SaveTheWorld ",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "04B",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Center(
                            child: Row(
                                children: kalps,
                                mainAxisAlignment: MainAxisAlignment.center)),
                        SizedBox(
                          height: 100,
                        ),
                        Center(
                            child: Text(
                          "T A P  T O  P L A Y",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        Center(
                            child: Image.asset(
                          "lib/images/world.png",
                          height: 200,
                          width: 200,
                        )),
                      ],
                    ),
                  )
                : Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Anasayfa()));
                              fonk3.cancel();
                              fonk.cancel();
                              fonk2.cancel();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Icon(
                                Icons.arrow_back_ios,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Center(
                              child: Text(
                                "SaveTheWorld ",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "04B",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Center(
                          child: Row(
                              children: kalps,
                              mainAxisAlignment: MainAxisAlignment.center)),
                      Expanded(
                          child: GridView.count(
                        crossAxisCount: 3,
                        children: <Widget>[
                          InkWell(
                              onTap: () {
                                if (isTapped != false) {
                                } else {
                                  isTapped = false;
                                  if (currentNum == 0) {
                                    skorArtir();
                                  } else {
                                    alerts();
                                  }
                                  isTapped = true;
                                }
                              },
                              child: Container(
                                height: 130,
                                width: 130,
                                child: Image.asset(
                                  "lib/images/ghost" +
                                      currentNum.toString() +
                                      ".png",
                                  color: currentNum == 0
                                      ? null
                                      : Colors.transparent,
                                ),
                              )),
                          InkWell(
                              onTap: () {
                                if (isTapped != false) {
                                } else {
                                  isTapped = false;
                                  if (currentNum == 1) {
                                    skorArtir();
                                  } else {
                                    alerts();
                                  }
                                  isTapped = true;
                                }
                              },
                              child: Container(
                                height: 130,
                                width: 130,
                                child: Image.asset(
                                  "lib/images/ghost" +
                                      currentNum.toString() +
                                      ".png",
                                  color: currentNum == 1
                                      ? null
                                      : Colors.transparent,
                                ),
                              )),
                          InkWell(
                              onTap: () {
                                if (isTapped != false) {
                                } else {
                                  isTapped = false;
                                  if (currentNum == 2) {
                                    skorArtir();
                                  } else {
                                    alerts();
                                  }
                                  isTapped = true;
                                }
                              },
                              child: Container(
                                height: 130,
                                width: 130,
                                child: Image.asset(
                                  "lib/images/ghost" +
                                      currentNum.toString() +
                                      ".png",
                                  color: currentNum == 2
                                      ? null
                                      : Colors.transparent,
                                ),
                              )),
                          InkWell(
                              onTap: () {
                                if (isTapped != false) {
                                } else {
                                  isTapped = false;
                                  if (currentNum == 3) {
                                    skorArtir();
                                  } else {
                                    alerts();
                                  }
                                  isTapped = true;
                                }
                              },
                              child: Container(
                                height: 130,
                                width: 130,
                                child: Image.asset(
                                  "lib/images/ghost" +
                                      currentNum.toString() +
                                      ".png",
                                  color: currentNum == 3
                                      ? null
                                      : Colors.transparent,
                                ),
                              )),
                          InkWell(
                              onTap: () {
                                if (isTapped != false) {
                                } else {
                                  isTapped = false;
                                  if (currentNum == 4) {
                                    skorArtir();
                                  } else {
                                    alerts();
                                  }
                                  isTapped = true;
                                }
                              },
                              child: Container(
                                height: 130,
                                width: 130,
                                child: Image.asset(
                                  "lib/images/ghost" +
                                      currentNum.toString() +
                                      ".png",
                                  color: currentNum == 4
                                      ? null
                                      : Colors.transparent,
                                ),
                              )),
                          InkWell(
                              onTap: () {
                                if (isTapped != false) {
                                } else {
                                  isTapped = false;
                                  if (currentNum == 5) {
                                    skorArtir();
                                  } else {
                                    alerts();
                                  }
                                  isTapped = true;
                                }
                              },
                              child: Container(
                                height: 130,
                                width: 130,
                                child: Image.asset(
                                  "lib/images/ghost" +
                                      currentNum.toString() +
                                      ".png",
                                  color: currentNum == 5
                                      ? null
                                      : Colors.transparent,
                                ),
                              )),
                          InkWell(
                              onTap: () {
                                if (isTapped != false) {
                                } else {
                                  isTapped = false;
                                  if (currentNum == 6) {
                                    skorArtir();
                                  } else {
                                    alerts();
                                  }
                                  isTapped = true;
                                }
                              },
                              child: Container(
                                height: 130,
                                width: 130,
                                child: Image.asset(
                                  "lib/images/ghost" +
                                      currentNum.toString() +
                                      ".png",
                                  color: currentNum == 6
                                      ? null
                                      : Colors.transparent,
                                ),
                              )),
                          InkWell(
                              onTap: () {
                                if (isTapped != false) {
                                } else {
                                  isTapped = false;
                                  if (currentNum == 7) {
                                    skorArtir();
                                  } else {
                                    alerts();
                                  }
                                  isTapped = true;
                                }
                              },
                              child: Container(
                                height: 130,
                                width: 130,
                                child: Image.asset(
                                  "lib/images/ghost" +
                                      currentNum.toString() +
                                      ".png",
                                  color: currentNum == 7
                                      ? null
                                      : Colors.transparent,
                                ),
                              )),
                          InkWell(
                              onTap: () {
                                if (isTapped != false) {
                                } else {
                                  isTapped = false;
                                  if (currentNum == 8) {
                                    skorArtir();
                                  } else {
                                    alerts();
                                  }
                                  isTapped = true;
                                }
                              },
                              child: Container(
                                height: 130,
                                width: 130,
                                child: Image.asset(
                                  "lib/images/ghost" +
                                      currentNum.toString() +
                                      ".png",
                                  color: currentNum == 8
                                      ? null
                                      : Colors.transparent,
                                ),
                              )),
                        ],
                        mainAxisSpacing: 60,
                      )),
                      Text(
                        "$skor",
                        style: TextStyle(fontFamily: "04B", fontSize: 30),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
