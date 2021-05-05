import 'package:upchar/global/global.dart';
import 'package:upchar/screens/persondetails.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:upchar/global/modal.dart';
import 'dart:math';
import 'dart:convert';
import '../global/global.dart';
import 'package:upchar/screens/map.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ListOfPatient extends StatefulWidget {
  @override
  _ListOfPatientState createState() => _ListOfPatientState();
}

class _ListOfPatientState extends State<ListOfPatient> {
  List<Together> data = List();
  bool loading = true;
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    http.Response response = await http.post(
        "https://wboostappservice.azurewebsites.net/Donor/Locate",
        body: jsonEncode(
          <String, String>{
            "lat": "28.81644007297397",
            "long": "77.1692988261855"
          },
        ));
    print(response.body);
    var element = jsonDecode(response.body);
    for (var value in element) {
      data.add(Together.fromJson(value));
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [
        ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return Details();
                  },
                ));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: width / 6,
                              width: width,
                            ),
                            FlipCard(
                              back: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: <Color>[
                                            Colors.orange,
                                            Colors.yellow
                                          ])),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Gender :",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Expanded(child: Container()),
                                            Flexible(
                                                child:
                                                    Text(data[index].gender)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.mobile_friendly,
                                              color: Colors.white,
                                            ),
                                            Expanded(child: Container()),
                                            Flexible(
                                                child:
                                                    Text(data[index].number)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.date_range,
                                              color: Colors.white,
                                            ),
                                            Expanded(child: Container()),
                                            Flexible(
                                                child: Text(data[index].dob)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_city,
                                              color: Colors.white,
                                            ),
                                            Expanded(child: Container()),
                                            Flexible(
                                              child: Text(
                                                  data[index].patientAddress),
                                            ),
                                            // Expanded(child: Container()),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Text(
                                          "Health Condition",
                                          style: TextStyle(
                                              color: Colors.white,
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
                                              color: Colors.white,
                                            ),
                                            Expanded(child: Container()),
                                            Flexible(
                                              child: Text(data[index].address),
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
                                              Icons.report_problem,
                                              color: Colors.white,
                                            ),
                                            Expanded(child: Container()),
                                            Flexible(
                                              child: Text(data[index].problem),
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
                                              color: Colors.white,
                                            ),
                                            Expanded(child: Container()),
                                            Flexible(
                                              child:
                                                  Text(data[index].admitDate),
                                            ),
                                            // Expanded(child: Container()),
                                          ],
                                        ),
                                        InkWell(
                                            onTap: () {
                                              destination = false;
                                              // marid = data[index].hospital;
                                              // destinationlatlng = LatLng(
                                              //     data[index].lat,
                                              //     data[index].long);
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: (context) => Map(),
                                              ));
                                            },
                                            child: Center(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.lightBlue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 28.0,
                                                      vertical: 10),
                                                  child: Text(
                                                    "See on Map",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            )),
                                        SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              front: Container(
                                width: width,
                                // height: width / 2,
                                constraints:
                                    BoxConstraints(minHeight: width / 2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: <Color>[
                                          Colors.orange,
                                          Colors.orangeAccent
                                        ])),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: width / 10,
                                    ),
                                    Text(data[index].name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(data[index].admitDate,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    Container(
                                      width: width / 2,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(
                                              Icons.mobile_friendly,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                            Text(data[index].number,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  // fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
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
                                      child: Text(data[index].problem,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: Container(
                            height: width / 4,
                            width: width / 4,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.greenAccent),
                            child: ClipOval(
                              child: Image.network(
                                url[Random().nextInt(5)],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
        Align(
          alignment: Alignment.topRight,
          child: SafeArea(
            child: IconButton(
              color: Colors.black,
              icon: Icon(Icons.three_k),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            height: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    option = 1;
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: option == 1
                                          ? Colors.blue
                                          : Colors.white,
                                      border: option != 1
                                          ? Border.all()
                                          : Border.all(color: Colors.blue),
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "By Providing Food",
                                          style: TextStyle(
                                            color: option == 1
                                                ? Colors.white
                                                : Colors.blue,
                                          ),
                                        )),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    option = 2;
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: option == 2
                                          ? Colors.blue
                                          : Colors.white,
                                      border: option != 2
                                          ? Border.all()
                                          : Border.all(color: Colors.blue),
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "By Providing Medical Facilities",
                                          style: TextStyle(
                                            color: option == 2
                                                ? Colors.white
                                                : Colors.blue,
                                          ),
                                        )),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    option = 3;
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: option == 3
                                          ? Colors.blue
                                          : Colors.white,
                                      border: option != 3
                                          ? Border.all()
                                          : Border.all(color: Colors.blue),
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "By Providing Money",
                                          style: TextStyle(
                                            color: option == 3
                                                ? Colors.white
                                                : Colors.blue,
                                          ),
                                        )),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    option = 4;
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: option == 4
                                          ? Colors.blue
                                          : Colors.white,
                                      border: option != 4
                                          ? Border.all()
                                          : Border.all(color: Colors.blue),
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Any Type of Help",
                                          style: TextStyle(
                                            color: option == 4
                                                ? Colors.white
                                                : Colors.blue,
                                          ),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )).whenComplete(() {
                  setState(() {});
                });
              },
            ),
          ),
        )
      ],
    ));
  }

  int option = 4;
}
