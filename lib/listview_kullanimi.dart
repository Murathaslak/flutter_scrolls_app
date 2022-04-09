// ignore_for_file: must_be_immutable, prefer_const_constructors, unused_import, avoid_print, prefer_adjacent_string_concatenation, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ListViewKullanimi extends StatelessWidget {
  ListViewKullanimi({Key? key}) : super(key: key);

  List<Ogrenci> tumOgrenciler = List.generate(500,
      (index) => Ogrenci(index + 1, "Ad: ${index + 1}", "Soyad: ${index + 1}"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Listesi"),
      ),
      body: buildListviewSeparated(),
    );
  }

  ListView buildListviewSeparated() {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        var oankiOgrenci = tumOgrenciler[index];
        return Card(
          color:
              index % 2 == 0 ? Colors.orange.shade100 : Colors.purple.shade100,
          child: ListTile(
            onTap: () {
              if (index % 2 == 0) {
                EasyLoading.instance.backgroundColor = Colors.purple.shade100;
              } else {
                EasyLoading.instance.backgroundColor = Colors.blue;
              }
              EasyLoading.showToast("Eleman tıklandı",
                  duration: Duration(
                    seconds: 3,
                  ),
                  dismissOnTap: true,
                  toastPosition: EasyLoadingToastPosition.bottom);
            },
            onLongPress: () {
              _alertDialogIslemleri(
                  context, oankiOgrenci.isim, oankiOgrenci.soyisim);
            },
            title: Text(oankiOgrenci.isim),
            subtitle: Text(oankiOgrenci.soyisim),
            leading: CircleAvatar(
              child: Text(oankiOgrenci.id.toString()),
            ),
          ),
        );
      },
      itemCount: tumOgrenciler.length,
      separatorBuilder: (context, index) {
        var yeniIndex = index + 1;
        if (yeniIndex % 4 == 0) {
          return Divider(
            thickness: 2,
            height: 20,
            color: Colors.teal,
          );
        }
        return SizedBox();
      },
    );
  }

  ListView klasikListView() {
    return ListView(
      children: tumOgrenciler
          .map((Ogrenci ogr) => ListTile(
                title: Text(ogr.isim),
                subtitle: Text(ogr.soyisim),
                leading: CircleAvatar(
                  child: Text(ogr.id.toString()),
                ),
              ))
          .toList(),
    );
  }

  void _alertDialogIslemleri(
      BuildContext myContext, String ogrAd, String ogrSoy) {
    showDialog(
        barrierDismissible: false,
        context: myContext,
        builder: (context) {
          return AlertDialog(
            title: Text("$ogrAd" + " $ogrSoy"),
            content: SingleChildScrollView(
              child: Text("Osman Murat Haşlak"),
            ),
            actions: [
              ButtonBar(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Kapat")),
                  TextButton(onPressed: () {}, child: Text("Tamam")),
                ],
              )
            ],
          );
        });
  }
}

class Ogrenci {
  final int id;
  final String isim;
  final String soyisim;

  Ogrenci(this.id, this.isim, this.soyisim);
}
