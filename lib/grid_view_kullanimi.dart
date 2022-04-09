// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class GridViewOrnek extends StatelessWidget {
  const GridViewOrnek({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.red,
                    offset: Offset(10, 5),
                  ),
                ],
                border: Border.all(
                    color: Colors.orange, width: 10, style: BorderStyle.solid),
                //borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.red[10 * ((index + 1) % 8)],
                gradient: LinearGradient(
                    colors: [Colors.yellow, Colors.red],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                image: DecorationImage(
                    image: AssetImage("assets/images/res.jpg"),
                    fit: BoxFit.contain,
                    alignment: Alignment.topCenter)),
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Merhaba Flutter\n $index",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
          onTap: () => debugPrint("Merhaba Flutter $index tıklanıldı"),
          onDoubleTap: () =>
              debugPrint("Merhaba Flutter $index çift tıklanıldı"),
          onLongPress: () => debugPrint("Merhaba Flutter $index uzun basıldı"),
          onHorizontalDragStart: (e) =>
              debugPrint("Merhaba Flutter $e uzun basıldı"),
        );
      },
    );
  }
}

/*
GridView.count(
      crossAxisCount: 3,
      primary: false,
      padding: EdgeInsets.all(10),
      crossAxisSpacing: 20,
      mainAxisSpacing: 40,
      children: [
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text("Merhaba Flutter", textAlign: TextAlign.center),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text("Merhaba Flutter", textAlign: TextAlign.center),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text("Merhaba Flutter", textAlign: TextAlign.center),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text("Merhaba Flutter", textAlign: TextAlign.center),
        ),
      ],
    );
 */