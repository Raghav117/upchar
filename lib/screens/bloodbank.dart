import 'package:upchar/screens/bloodconfirmdetails.dart';
import 'package:upchar/screens/map.dart';
import 'package:flutter/material.dart';

import '../global/global.dart';

class BloodBankForm extends StatefulWidget {
  @override
  _BloodBankFormState createState() => _BloodBankFormState();
}

class _BloodBankFormState extends State<BloodBankForm> {
  TextEditingController patientName = TextEditingController();
  TextEditingController number = TextEditingController();
  DateTime dob;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          title: Text("Blood Bank"),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Colors.green, Colors.orange])),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: patientName,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: "Name of Patient",
                  labelText: "Name of Patient",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.green)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.green)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: number,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Phone Number",
                  labelText: "Phone Number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.green)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.green)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  showDialog(context: context, child: dialog());
                },
                child: Center(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28.0, vertical: 10),
                    child: Text(
                      bg == "" ? "BG" : bg,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                  onTap: () {
                    destination = false;
                    if (permission == true)
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Map(),
                      ));
                    else {
                      checkLocationPermission();
                      setState(() {});
                    }
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
                          userLocation == null
                              ? "Location"
                              : "Location\n" +
                                  userLocation.latitude.toString() +
                                  "," +
                                  userLocation.longitude.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 15,
              ),
              InputDatePickerFormField(
                  onDateSubmitted: (value) {
                    dob = value;
                    print(value);
                  },
                  onDateSaved: (value) {
                    dob = value;
                    print(value);
                  },
                  errorFormatText: "Ivnvalid Date",
                  errorInvalidText: "Invalid",
                  autofocus: true,
                  fieldLabelText: "Date of Birth",
                  firstDate: DateTime(1971),
                  lastDate: DateTime.now()),
              SizedBox(
                height: 45,
              ),
              InkWell(
                  onTap: () {
                    if (patientName.text.length != 0 &&
                        number.text.length != 0 &&
                        bg.length != 0 &&
                        userLocation != null &&
                        dob != null)
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BloodConfirmDetails(),
                      ));
                    else {
                      _scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text('All entries are correctly filled'),
                        duration: Duration(seconds: 5),
                      ));
                    }
                  },
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 39.0, vertical: 25),
                        child: Text(
                          "Check for Blood",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  dialog() {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        height: 400,
        width: 500,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      bg = "A+";
                    });
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28.0, vertical: 10),
                        child: Text(
                          "A+",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      bg = "A-";
                    });
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28.0, vertical: 10),
                        child: Text(
                          "A-",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      bg = "B+";
                    });
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28.0, vertical: 10),
                        child: Text(
                          "B+",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      bg = "B-";
                    });
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28.0, vertical: 10),
                        child: Text(
                          "B-",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      bg = "AB+";
                    });
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28.0, vertical: 10),
                        child: Text(
                          "AB+",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      bg = "AB-";
                    });
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28.0, vertical: 10),
                        child: Text(
                          "AB-",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      bg = "O+";
                    });
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28.0, vertical: 10),
                        child: Text(
                          "O+",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      bg = "O-";
                    });
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28.0, vertical: 10),
                        child: Text(
                          "O-",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
