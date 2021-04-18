import 'package:flutter/material.dart';

import 'bagisScreen.dart';
import 'oyunsayfasi.dart';


class Anasayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: new Stack(
            children: <Widget>[
              new Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new NetworkImage(
                        "https://scontent.fist7-2.fna.fbcdn.net/v/t1.6435-9/175365859_10222339551271013_791754373332707362_n.jpg?_nc_cat=103&ccb=1-3&_nc_sid=730e14&_nc_ohc=yIv45jmrjiEAX9sLqNJ&_nc_ht=scontent.fist7-2.fna&oh=fa33a5081893b918ae1ea9e9cd94fb71&oe=60A14A14"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              new Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Save me",
                        style: TextStyle(fontFamily: "Choco", fontSize: 70),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyHomePage())),
                        child: Container(
                          child: Center(
                              child: Text(
                                "OYNA",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              )),
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BagisScreen())),
                        child: Container(
                          child: Center(
                              child: Text(
                                "Bağış Yap",
                                style: TextStyle(color: Colors.black, fontSize: 20),
                              )),
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}