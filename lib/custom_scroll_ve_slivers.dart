// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CollapsableToolbarOrnek extends StatelessWidget {
  const CollapsableToolbarOrnek({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(
            "Sliver App Bar",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.red,
          expandedHeight: 200,
          floating: false,
          pinned: true,
          snap: false,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Sliver App Bar"),
            centerTitle: true,
            background: Image.asset(
              "assets/images/res.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            sabitListeElemanlari(),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(_dinamikElemanUretenFonksiyon,
                childCount: 6)),
        SliverPadding(
          padding: EdgeInsets.all(20),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(_dinamikElemanUretenFonksiyon,
                childCount: 6),
          ),
        ),
        /************************************************************************* */
        //Sabit elemanlarla bir satırda kaç eleman olacağını söylediğimiz grid türü
        SliverGrid(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          delegate: SliverChildListDelegate(sabitListeElemanlari()),
        ),
        //Dinamik(builder) elemanlarla bir satırda kaç eleman olacağını söylediğimiz grid türü
        SliverGrid(
          delegate: SliverChildBuilderDelegate(_dinamikElemanUretenFonksiyon,
              childCount: 6),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        ),
        SliverGrid(
            delegate: SliverChildBuilderDelegate(_dinamikElemanUretenFonksiyon,
                childCount: 6),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100)),
        SliverFixedExtentList(
            delegate: SliverChildListDelegate(sabitListeElemanlari()),
            itemExtent: 120),
        //performans istiyorsan bunu kullan aşağıdaki
        SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(_dinamikElemanUretenFonksiyon,
                childCount: 6),
            itemExtent: 50),
      ],
    );
  }

  List<Widget> sabitListeElemanlari() {
    return [
      Container(
        height: 100,
        child: Text(
          "Sabit Liste Elemanı 1",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        color: Colors.amber,
        alignment: Alignment.center,
      ),
      Container(
        height: 100,
        child: Text(
          "Sabit Liste Elemanı 2",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        color: Colors.teal,
        alignment: Alignment.center,
      ),
      Container(
        height: 100,
        child: Text(
          "Sabit Liste Elemanı 3",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        color: Colors.blue,
        alignment: Alignment.center,
      ),
      Container(
        height: 100,
        child: Text(
          "Sabit Liste Elemanı 4",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        color: Colors.cyan,
        alignment: Alignment.center,
      ),
      Container(
        height: 100,
        child: Text(
          "Sabit Liste Elemanı 5",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        color: Colors.purple,
        alignment: Alignment.center,
      ),
      Container(
        height: 100,
        child: Text(
          "Sabit Liste Elemanı 6",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        color: Colors.cyan,
        alignment: Alignment.center,
      ),
    ];
  }

  Widget? _dinamikElemanUretenFonksiyon(BuildContext context, int index) {
    return Container(
      height: 100,
      color: rastgeleRenkUret(),
      alignment: Alignment.center,
      child: Text(
        "Dinamik Liste Elemanı ${index + 1}",
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }

  Color rastgeleRenkUret() {
    return Color.fromARGB(Random().nextInt(255), Random().nextInt(255),
        Random().nextInt(255), Random().nextInt(255));
  }
}
