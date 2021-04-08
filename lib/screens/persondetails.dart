import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 10,
            color: Colors.white.withOpacity(0.85),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "Mr. Raghav Garg",
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
                        Text(
                          "Gender :",
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                        Expanded(child: Container()),
                        Flexible(child: Text("Male")),
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
                        Flexible(child: Text("+91 9012220988")),
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
                        Flexible(child: Text("06/12/1999")),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_city,
                          color: Colors.orange,
                        ),
                        Expanded(child: Container()),
                        Flexible(
                          child: Text("Krishna Colony New Tehsil Bisauli"),
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
                          child: Text(
                              "Yathaart Hospital, Alpha 1, Street No. 45, Greater Noida"),
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
                          color: Colors.orange,
                        ),
                        Expanded(child: Container()),
                        Flexible(
                          child: Text("Required Plasma Urgently"),
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
                        Flexible(
                          child: Text("02/12/4825"),
                        ),
                        // Expanded(child: Container()),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
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
