import 'package:flutter/material.dart';
import 'package:logistic_app/Feuthers/driver/presentation/widgets/completed_trips.dart';
import 'package:logistic_app/Feuthers/driver/presentation/widgets/current_trips.dart';

class DriverHomeBody extends StatelessWidget {
  const DriverHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Column(
        children: [
          // TabBar for switching between tabs
          TabBar(
            tabs: const [
              Tab(text: 'Current'),
              Tab(text: 'Completed'),
              Tab(text: 'Future'),
            ],
            labelColor: Theme.of(context).colorScheme.primary,
            unselectedLabelColor: Theme.of(context).colorScheme.onSurface,
            indicatorColor: Theme.of(context).colorScheme.primary,
          ),
          // TabBarView to show the corresponding content
          const Expanded(
            child: TabBarView(
              children: [
                CurrentTripsScreen(),
                CompletedTripsScreen(),
                TabContent(title: 'Future Tasks'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Stateless widget for tab content
class TabContent extends StatelessWidget {
  final String title;

  const TabContent({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
