import 'dart:convert';

import 'package:upchar/global/modal.dart';
import 'package:flutter/material.dart';
import 'package:upchar/screens/map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import '../global/global.dart';

class Ventilators extends StatefulWidget {
  @override
  _VentilatorsState createState() => _VentilatorsState();
}

class _VentilatorsState extends State<Ventilators> {
  bool loading = true;
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    http.Response response = await http.post(
        "https://wboostappservice.azurewebsites.net/GeoQuery/Locate",
        body: jsonEncode(
          <String, String>{
            "lat": "28.81644007297397",
            "long": "77.1692988261855"
          },
        ));
    print(response.body);
    var element = jsonDecode(response.body);
    for (var value in element) {
      data.add(Data.fromJson(value));
    }
    setState(() {
      loading = false;
    });
  }

  List<Data> data = List();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          // title: Text("Covid Situation"),
          title: Text("Ventilators"),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Colors.green, Colors.orange])),
          )),
      body: loading == true
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        width: width,
                        constraints: BoxConstraints(minHeight: width / 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: <Color>[Colors.orange, Colors.green])),
                        child: Column(
                          children: [
                            SizedBox(
                              height: width / 10,
                            ),
                            Text(data[index].title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(data[index].address,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  "Ventilators Available -  ${data[index].ventilators}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(data[index].number,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            InkWell(
                                onTap: () {
                                  destination = true;
                                  marid = data[index].title;
                                  destinationlatlng =
                                      LatLng(data[index].lat, data[index].long);
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Map(),
                                  ));
                                },
                                child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.lightBlue,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 28.0, vertical: 10),
                                      child: Text(
                                        "See on Map",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: width / 6,
                      )
                    ],
                  );
                },
              )),
    );
  }
}
