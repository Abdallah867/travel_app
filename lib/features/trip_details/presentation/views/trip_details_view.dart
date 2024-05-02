import 'package:flutter/material.dart';

class TripDetailsView extends StatelessWidget {
  final String tripId;
  const TripDetailsView({super.key, required this.tripId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(tripId),
      ),
    );
  }
}
