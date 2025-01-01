import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../../core/functions/custom_app_bar.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        'View Ticket',
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Scan This QR',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                QrImageView(
                  data: 'Ticket123456789', // Replace with dynamic data
                  version: QrVersions.auto,
                  size: 130.0,
                ),
                Divider(
                  thickness: 1,
                  height: 40,
                  color: Colors.grey.withOpacity(0.5),
                ),
                const Column(
                  children: [
                    TicketInfoRow(
                        label: 'TRAVELER 1', value: 'Abdallah Mohellebi'),
                    TicketInfoRow(label: 'TRAVELER 2', value: 'Samir Lahlouhi'),
                    TicketInfoRow(label: 'TIME', value: '9:00 PM'),
                    TicketInfoRow(label: 'DATE', value: 'August 21 2024'),
                    TicketInfoRow(label: 'SEAT', value: 'A2'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TicketInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const TicketInfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
