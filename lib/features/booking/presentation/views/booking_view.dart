import 'package:flutter/material.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const Column(
          children: [
            Text('Nombre d\'adultes'),
            Text('Nombre d\'enfants'),
          ],
        ));
  }
}
