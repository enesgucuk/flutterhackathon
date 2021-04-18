import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BagisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 70,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green,
                      offset: Offset(2.0, 5.0), //(x,y)
                      blurRadius: 20.0,
                    ),
                  ],
                ),
                height: 200,
                width: 200,
                child: CircleAvatar(
                    backgroundColor: Colors.green[500],
                    child: Image.asset(
                      "lib/images/enes.png",
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Enes Gücükoğlu",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Center(
                  child: Text(
                "2560 Toplanan Çöp",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 5.0),
                  borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Bağışlanan Para",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "181\$",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Toplam Çöp Değeri",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "19\$",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Hedef Miktar",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "1500\$",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(
                      msg: "ÇOK YAKINDA !!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
                child: Container(
                  height: 50,
                  width: 220,
                  child: Center(
                      child: Text(
                    "Mecvut Parayı Bağışla",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
