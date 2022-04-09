// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CardveListtileKullanimi extends StatelessWidget {
  const CardveListtileKullanimi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card ve List tile"),
      ),
      body: Center(
        child: ListView(
          reverse: true,
          children: [
            Column(
              children: [
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
                tekListeElemani(),
              ],
            ),
            Text("SELAM"),
            ElevatedButton(onPressed: () {}, child: Text("Buton"))
          ],
        ),
      ),
    );
  }

  SingleChildScrollView singleChildScrollKullan() {
    return SingleChildScrollView(
      child: Column(
        children: [
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
          tekListeElemani(),
        ],
      ),
    );
  }

  Column tekListeElemani() {
    return Column(
      children: [
        Card(
            color: Colors.blue.shade100,
            shadowColor: Colors.red,
            elevation: 12,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              leading: CircleAvatar(child: Icon(Icons.add)),
              title: Text("Başlık  Kısmı"),
              subtitle: Text("Alt Başlık Kısmı"),
              trailing: Icon(Icons.real_estate_agent),
            )),
        Divider(
          color: Colors.red,
          thickness: 2,
          height: 10,
          indent: 60,
          endIndent: 60,
        ),
      ],
    );
  }
}
