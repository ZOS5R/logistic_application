import 'dart:async';
import 'dart:convert';
import 'dart:math'; // Import for mathematical calculations

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late GoogleMapController _controller;
  final LatLng _startPosition =
      const LatLng(37.7749, -122.4194); // Example: San Francisco
  final LatLng _endPosition = const LatLng(37.7849, -122.4294); // Destination

  // Marker IDs
  final MarkerId _startMarkerId = const MarkerId('start_marker');
  final MarkerId _endMarkerId = const MarkerId('end_marker');
  final MarkerId _movingMarkerId = const MarkerId('moving_marker');

  // List to store route coordinates
  final List<LatLng> _routeCoordinates = [];
  LatLng? _currentPosition;
  int _routeIndex = 0;

  // Car speed in meters per second
  final double _carSpeed = 10.0; // Adjust this value as needed
  Timer? _animationTimer;
  BitmapDescriptor? _carIcon;
  double _currentRotation = 0.0; // Variable to store the current rotation angle

  @override
  void initState() {
    super.initState();
    _currentPosition = _startPosition;
    _fetchDirections();
    _loadCarIcon(); // Load custom car icon
  }

  Future<void> _loadCarIcon() async {
    _carIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(48, 48)), // Adjust size as needed
      'assets/google_maps/truck_icon.png', // Path to your car icon
    );
  }

  Future<void> _fetchDirections() async {
    const String googleMapsApiKey =
        'AIzaSyDEU0SDALQ9C0PBycbw9j9eNPbTlaaN2Ic'; // Replace with your actual API Key
    final String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${_startPosition.latitude},${_startPosition.longitude}&destination=${_endPosition.latitude},${_endPosition.longitude}&key=$googleMapsApiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['routes'].isNotEmpty) {
        final route = data['routes'][0];
        final List<dynamic> legs = route['legs'];
        final List<dynamic> steps = legs[0]['steps'];

        for (var step in steps) {
          final LatLng latLng = LatLng(
            step['end_location']['lat'],
            step['end_location']['lng'],
          );
          _routeCoordinates.add(latLng);
        }
        _animateMarker();
      }
    } else {
      throw Exception('Failed to fetch directions');
    }
  }

  void _animateMarker() {
    const int durationInMilliseconds = 20000; // Total duration of the animation
    const int steps = 100; // Number of steps for the animation

    // Calculate the time interval for each animation step
    const int interval = (durationInMilliseconds ~/ steps);
    double traveledDistance = 0.0;

    _animationTimer?.cancel(); // Cancel any existing timer
    _animationTimer =
        Timer.periodic(const Duration(milliseconds: interval), (timer) {
      if (_routeIndex < _routeCoordinates.length - 1) {
        LatLng start = _routeCoordinates[_routeIndex];
        LatLng end = _routeCoordinates[_routeIndex + 1];

        double segmentDistance = Geolocator.distanceBetween(
          start.latitude,
          start.longitude,
          end.latitude,
          end.longitude,
        );

        // Calculate how far to travel on this segment
        if (traveledDistance < segmentDistance) {
          // Update the current position
          double fraction = traveledDistance / segmentDistance;
          _currentPosition = LatLng(
            start.latitude + (end.latitude - start.latitude) * fraction,
            start.longitude + (end.longitude - start.longitude) * fraction,
          );

          // Calculate the angle of rotation based on the movement direction
          double deltaLat = end.latitude - start.latitude;
          double deltaLng = end.longitude - start.longitude;
          double targetRotation = atan2(deltaLat, deltaLng) *
              (180 / pi); // Convert radian to degree

          // Set the current rotation to the target rotation
          _currentRotation = targetRotation;

          traveledDistance +=
              _carSpeed * (interval / 1000); // Speed in meters per interval
        } else {
          // Move to the next segment
          traveledDistance = 0;
          _routeIndex++;
        }

        setState(() {});
      } else {
        timer.cancel(); // Stop the timer when finished
      }
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _startPosition,
          zoom: 14,
        ),
        markers: {
          Marker(
            markerId: _startMarkerId,
            position: _startPosition,
            infoWindow: const InfoWindow(title: 'Start Position'),
          ),
          Marker(
            markerId: _endMarkerId,
            position: _endPosition,
            infoWindow: const InfoWindow(title: 'End Position'),
          ),
          Marker(
            markerId: _movingMarkerId,
            position: _currentPosition ?? const LatLng(0, 0),
            icon: _carIcon ?? BitmapDescriptor.defaultMarker, // Use custom icon
            rotation: _currentRotation, // Set rotation for the marker
            infoWindow: const InfoWindow(title: 'Moving Marker'),
          ),
        },
        polylines: {
          Polyline(
            polylineId: const PolylineId('route'),
            // Set a gradient color - this is a placeholder as it needs a custom implementation
            color: Colors.blue,
            width: 6, // Thicker line for visibility
            points: _routeCoordinates,
            // Uncomment and implement a dashed style if needed with a custom renderer
            // pattern: [PatternItem.dash(20), PatternItem.gap(10)],
          ),
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationTimer?.cancel(); // Clean up the timer on dispose
    super.dispose();
  }
}
