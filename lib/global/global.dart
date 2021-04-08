import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

String bg = "";
LocationData userLocation;
bool destination = false;
LatLng destinationlatlng = LatLng(28.5320, 77.3845);
bool permission;
String marid = "";

requestLocationPermission() async {
  // PermissionStatus result = await SimplePermissions.requestPermission(Permission.ReadExternallocation);
  var result = await [Permission.location].request();
  if (result[Permission.location].isDenied) {
    permission = false;
  } else if (result[Permission.location].isGranted) {
    permission = true;
    getLocation();
  } else {
    permission = false;
  }
}

checkLocationPermission() async {
  var result = await Permission.location.status;
  if (result.isDenied) {
    await requestLocationPermission();
  } else if (result.isGranted) {
    getLocation();

    permission = true;
  } else {
    await requestLocationPermission();
  }
}

Location location = new Location();

getLocation() async {
  userLocation = await location.getLocation();
  print(userLocation);
}

List url = [
  "https://th.bing.com/th/id/OIP.sEdLXNW5VIt2MDkaWuPaqAHaE4?pid=Api&rs=1",
  "https://th.bing.com/th/id/R58b4cc28790bee84123fd0b574c10e2f?rik=YqqlIkq%2fMrVOUA&riu=http%3a%2f%2fblogs.reuters.com%2findia%2ffiles%2f2012%2f06%2fpoor.jpg&ehk=Uk19t4Lof3sOoRWcw1nougOLjCVEmagANAPOTYUuFVE%3d&risl=&pid=ImgRaw",
  "https://amitnep.files.wordpress.com/2015/02/poverty.jpg",
  "https://th.bing.com/th/id/OIP.uCZKXNWpVDwGCpeWElPuhQHaEK?pid=Api&rs=1",
  "https://th.bing.com/th/id/OIP.B9J7yl42ie30FKfuEEYQtgHaFj?pid=Api&rs=1",
];

double dontaion = 6000;

double rs = 7000;
