import 'package:flutter/material.dart';
// import 'package:your_app/services/notification_service.dart';

import '../utils/notification_service.dart'; // Adjust path as needed

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = NotificationService.receivedNotifications;

    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: notifications.isEmpty
          ? const Center(child: Text('No notifications yet'))
          : ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];
          return ListTile(
            leading: const Icon(Icons.notifications, color: Colors.deepPurple),
            title: Text(item['title'] ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(item['body'] ?? ''),
          );
        },
      ),
    );
  }
}
