import 'dart:convert';

import 'package:upchar/global/modal.dart';
import 'package:flutter/material.dart';
import 'package:upchar/screens/map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../global/global.dart';

class BloodConfirmDetails extends StatefulWidget {
  @override
  _BloodConfirmDetailsState createState() => _BloodConfirmDetailsState();
}

class _BloodConfirmDetailsState extends State<BloodConfirmDetails> {
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
            "long": "77.1692988261855",
            "bg": bg
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
      body: loading == true
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 10,
                  color: Colors.white.withOpacity(0.85),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            width: width,
                            height: width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                data[0].url,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Text(
                            data[0].title,
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.local_hospital,
                                color: Colors.orange,
                              ),
                              Expanded(child: Container()),
                              Flexible(
                                child: Text(data[0].address),
                              ),
                              // Expanded(child: Container()),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.mobile_friendly,
                                color: Colors.orange,
                              ),
                              Expanded(child: Container()),
                              Flexible(child: Text(data[0].number)),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Donor's Data",
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: Colors.orange,
                              ),
                              Expanded(child: Container()),
                              Flexible(
                                child: Text(data[0].donor),
                              ),
                              // Expanded(child: Container()),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.date_range,
                                color: Colors.orange,
                              ),
                              Expanded(child: Container()),
                              Flexible(child: Text(data[0].number)),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.report_problem,
                                color: Colors.orange,
                              ),
                              Expanded(child: Container()),
                              Flexible(
                                child: Text(bg),
                              ),
                              // Expanded(child: Container()),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                              onTap: () {
                                destination = true;

                                marid = data[0].title;
                                destinationlatlng =
                                    LatLng(data[0].lat, data[0].long);
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Map(),
                                ));
                              },
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlue,
                                      borderRadius: BorderRadius.circular(20)),
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
