
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<String> fetchLocation() async {
  bool serviceEnabled;
  LocationPermission permission;
  
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if(!serviceEnabled) {
    Future.error('Location Services are disabled');
  }
  
  permission = await Geolocator.checkPermission();
  if(permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if(permission == LocationPermission.denied) {
      Future.error('Location permissions are denied');
    }
  }
  
  if(permission == LocationPermission.deniedForever) {
    return Future.error('Location permissions are permanently denied, we cannot request permissions');
  }

  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );

  List <Placemark> placeMarks = await placemarkFromCoordinates(position.latitude, position.longitude);
  Placemark placeMark = placeMarks[0];
  String? city = placeMark.locality;
  return city ?? "";
}