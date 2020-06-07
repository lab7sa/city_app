import 'package:geolocator/geolocator.dart';

class GetLocation{

  static Future<String> getMyLocation() async {
    try {
      Position position = await Geolocator().getLastKnownPosition(
          desiredAccuracy: LocationAccuracy.high);
      if (position != null) {
        var citName = await _getMyCity(position.latitude, position.longitude);
        return citName;
      } else {
        print('error message: could not return city name');
      }
    } catch (e) {
      return e;
    }
  }


  static Future<String> _getMyCity(double lat, double lon) async{

    try{
      List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(lat, lon);
      if(placemark.isNotEmpty){
        return placemark[0].locality.toString();
      }else{
        print('error message: could not return city name');
      }
    }catch(e){
      return e;
    }


  }


}