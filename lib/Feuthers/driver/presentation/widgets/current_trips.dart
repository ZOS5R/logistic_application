import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:logistic_app/Feuthers/driver/presentation/widgets/trip_card/current_trip_card.dart';
import 'package:logistic_app/core/router/rotue_names.dart';

class CurrentTripsScreen extends StatefulWidget {
  const CurrentTripsScreen({super.key});

  @override
  _CurrentTripsScreenState createState() => _CurrentTripsScreenState();
}

class _CurrentTripsScreenState extends State<CurrentTripsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8.0.dg),
        child: Column(
          children: List.generate(1, (index) {
            final slideAnimation = Tween<Offset>(
              begin: const Offset(0, 0.3),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: _controller,
                curve: Interval(
                  index * 0.2,
                  1.0,
                  curve: Curves.easeInOut,
                ),
              ),
            );

            final fadeAnimation = Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: _controller,
                curve: Interval(
                  index * 0.2,
                  1.0,
                  curve: Curves.easeInOut,
                ),
              ),
            );

            return AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return SlideTransition(
                  position: slideAnimation,
                  child: FadeTransition(
                    opacity: fadeAnimation,
                    child: InkWell(
                      onTap: () {
                        context.push(RouteNames.orderDetails);
                      },
                      child: const CurrentTripCard(),
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
