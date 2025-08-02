import 'package:flutter/material.dart';
// import '../services/notification_service.dart';
import '../utils/notification_service.dart';

class MedicineScreen extends StatelessWidget {
  const MedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order Medicine")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            NotificationService.showMedicineReminderNotification();
          },
          child: const Text("Show Medicine Notification"),
        ),
      ),
    );
  }
}
