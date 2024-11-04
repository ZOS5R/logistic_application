import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  // Function to request location permissions and get user's country name
  static Future<String?> getCountryName() async {
    await setLocaleIdentifier('en');

    // Step 1: Check and request location permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permission is denied, return null or handle accordingly
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are permanently denied, handle accordingly
      return null;
    }

    // Step 2: Get current location (latitude and longitude)
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Step 3: Convert coordinates into place information (country name)
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      // Extract the country name from placemarks if available
      if (placemarks.isNotEmpty) {
        return placemarks.first.country;
      }
    } catch (e) {
      print('Error occurred while getting country name: $e');
    }

    return null; // Return null if unable to get the country name
  }
}
