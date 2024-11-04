import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart'; // Add this import
import 'package:logistic_app/core/style/text_style.dart';
import 'package:logistic_app/core/widgets/back_icon.dart';
import 'package:logistic_app/core/widgets/buttons/button.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen>
    with SingleTickerProviderStateMixin {
  late GoogleMapController _controller;
  final LatLng _startPosition = const LatLng(37.7749, -122.4194);
  final LatLng _endPosition = const LatLng(37.7849, -122.4294);

  final MarkerId _startMarkerId = const MarkerId('start_marker');
  final MarkerId _endMarkerId = const MarkerId('end_marker');
  final MarkerId _movingMarkerId = const MarkerId('moving_marker');

  final List<LatLng> _routeCoordinates = [];
  LatLng? _currentPosition;
  int _routeIndex = 0;

  final double _carSpeed = 40.0;
  Timer? _animationTimer;
  BitmapDescriptor? _carIcon;

  int _currentStep = 0; // Track the current step
  late AnimationController _animationController; // Animation controller
  late Animation<double> _animation; // Animation for fade effect
  final TextEditingController _otpController =
      TextEditingController(); // Controller for OTP input
  List<XFile>? _images; // Store selected images

  // Define delivery steps
  final List<Map<String, String>> _steps = [
    {
      'title': 'Pickup Address',
      'content': 'No 2, Balonny Close, Allen Avenue',
      'button': 'Package Picked up'
    },
    {
      'title': 'Delivery Address',
      'content': '87, South Lester Street, London Close\nBelgium',
      'button': 'Start Trip'
    },
    {
      'title': 'Delivery Address',
      'content': '87, South Lester Street, London Close\nBelgium',
      'button': 'I Have Arrived At Delivery Address'
    },
    {
      'title': 'Delivery Address',
      'content': '87, South Lester Street, London Close\nBelgium',
      'button': 'Package Delivered'
    },
  ];

  @override
  void initState() {
    super.initState();
    _currentPosition = _startPosition;
    _fetchDirections();
    _loadCarIcon();

    // Initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    // Create a fade-in animation
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.forward();
  }

  Future<void> _loadCarIcon() async {
    _carIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(48, 48)),
      'assets/google_maps/truck_icon.png',
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
    const int durationInMilliseconds = 20000;
    const int steps = 100;

    const int interval = (durationInMilliseconds ~/ steps);
    double traveledDistance = 0.0;

    _animationTimer?.cancel();
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

        if (traveledDistance < segmentDistance) {
          double fraction = traveledDistance / segmentDistance;
          _currentPosition = LatLng(
            start.latitude + (end.latitude - start.latitude) * fraction,
            start.longitude + (end.longitude - start.longitude) * fraction,
          );

          setState(() {});

          traveledDistance += _carSpeed * (interval / 1000);
        } else {
          traveledDistance = 0;
          _routeIndex++;
        }

        setState(() {});
      } else {
        timer.cancel();
      }
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  void _nextStep() {
    if (_currentStep < _steps.length - 1) {
      setState(() {
        _currentStep++;
        _animationController.reset();
        _animationController.forward();
      });
    } else {
      _showConfirmationDialog();
    }
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Enter 6-digit OTP code:'),
              TextField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: const InputDecoration(
                  hintText: 'OTP Code',
                ),
              ),
              const SizedBox(height: 20),
              const Text('Select product images:'),
              GestureDetector(
                onTap: _pickImages,
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text('Tap to select images'),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: _submitForm,
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> selectedImages = await picker.pickMultiImage();

    setState(() {
      _images = selectedImages;
    });
  }

  void _submitForm() {
    final otpCode = _otpController.text;
    if (otpCode.length == 6 && _images != null) {
      // Here you can handle the form submission logic, e.g., send data to the server.
      Navigator.of(context).pop(); // Close dialog after submission
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully!')),
      );
    } else {
      // Show error message if OTP is not valid or images not selected
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please enter a valid OTP and select images.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackIcon(),
        title: const Text('Google Map'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _startPosition,
              zoom: 14,
            ),
            markers: {
              Marker(
                markerId: _endMarkerId,
                position: _endPosition,
                infoWindow: const InfoWindow(title: 'End Position'),
              ),
              Marker(
                markerId: _movingMarkerId,
                position: _currentPosition!,
                icon: _carIcon ?? BitmapDescriptor.defaultMarker,
              ),
            },
            polylines: {
              Polyline(
                polylineId: const PolylineId('route'),
                points: _routeCoordinates,
                color: Colors.blue,
                width: 5,
              ),
            },
          ),
          Positioned(
            bottom: 20.h,
            left: 20.w,
            right: 20.w,
            child: FadeTransition(
              opacity: _animation,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(_steps[_currentStep]['title']!,
                        style: TextStyles.text_18(context)),
                    const SizedBox(height: 10),
                    Text(_steps[_currentStep]['content']!,
                        style: TextStyles.text_14(context)),
                    const SizedBox(height: 10),
                    CustomButton(
                      text: _steps[_currentStep]['button']!,
                      onPressed: _nextStep,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationTimer?.cancel();
    super.dispose();
  }
}
