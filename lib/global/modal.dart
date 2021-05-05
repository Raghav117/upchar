import 'package:google_maps_flutter/google_maps_flutter.dart';

class Data {
  String title;
  String address;
  String number;
  String donor;
  String date;
  String bg;
  double lat;
  double long;
  String url;
  int ventilators;

  Data(
      {this.title,
      this.address,
      this.number,
      this.donor,
      this.date,
      this.bg,
      this.url,
      this.ventilators});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    address = json['address'];
    number = json['number'];
    donor = json['donor'];
    date = json['date'];
    bg = json['bg'];
    lat = json['latlong']["position"]["latitude"];
    long = json['latlong']["position"]["longitude"];
    url = json['url'];
    ventilators = json['ventilators'];
  }
}

class Together {
  String name;
  String admitDate;
  String dob;
  String number;
  String hospital;
  String address;
  String problem;
  String patientAddress;
  String gender;
  double lat;
  double long;

  Together.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    admitDate = json['admit_date'];
    dob = json['dob'];
    number = json['number'];
    hospital = json['hospital'];
    address = json['address'];
    problem = json['problem'];
    patientAddress = json['patient_address'];
    gender = json['Gender'];
    lat = json["latlong"]["position"]["latitude"];
    lat = json["latlong"]["position"]["longitude"];
  }
}
