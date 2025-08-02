import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  // Store received notifications
  static final List<Map<String, String>> receivedNotifications = [];

  static Future<void> init() async {
    if (await Permission.notification.isDenied ||
        await Permission.notification.isRestricted) {
      await Permission.notification.request();
    }

    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidInit);

    await _notificationsPlugin.initialize(initSettings);
  }

  static Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'femivio_channel',
      'Femivio Notifications',
      channelDescription: 'All notifications for Femivio app',
      importance: Importance.max,
      priority: Priority.high,
    );

    const details = NotificationDetails(android: androidDetails);

    // Show system notification
    await _notificationsPlugin.show(id, title, body, details);

    // Store locally for UI page
    receivedNotifications.insert(0, {
      'title': title,
      'body': body,
    });
  }

  // Ready-to-use methods
  static Future<void> showRideBookingNotification() async {
    await showNotification(
      id: 1,
      title: 'Ride Booked 🚖',
      body: 'Your ride has been booked successfully.',
    );
  }

  static Future<void> showFoodDeliveryNotification() async {
    await showNotification(
      id: 2,
      title: 'Food on the way 🍕',
      body: 'Your food order is being prepared.',
    );
  }

  static Future<void> showDoctorAppointmentReminder() async {
    await showNotification(
      id: 3,
      title: 'Doctor Appointment 🩺',
      body: 'Reminder: You have a doctor appointment today.',
    );
  }

  static Future<void> showMedicineReminderNotification() async {
    await showNotification(
      id: 4,
      title: 'Time to take medicine 💊',
      body: 'Stay healthy! Take your medicine on time.',
    );
  }

  static Future<void> showHairStyleBookingNotification() async {
    await showNotification(
      id: 5,
      title: 'Hair Style Booking 💇',
      body: 'Your salon appointment is confirmed.',
    );
  }

  static Future<void> showPaymentIssueNotification() async {
    await showNotification(
      id: 6,
      title: 'Payment Failed ⚠️',
      body: 'We could not process your payment. Please retry.',
    );
  }

  static Future<void> showNewFeatureUpdate() async {
    await showNotification(
      id: 7,
      title: 'New Feature Unlocked 🚀',
      body: 'Check out new features available in Femivio!',
    );
  }
}
