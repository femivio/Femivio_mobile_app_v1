import 'package:flutter/material.dart';
import 'package:femivio_project/screens/home_screen.dart';
import 'package:femivio_project/screens/login_screen.dart';
import 'package:femivio_project/screens/register_screen.dart';
import 'package:femivio_project/utils/notification_service.dart'; // ✅ Import your notification service

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init(); // ✅ Initialize notifications

  // ✅ Optional: Auto-trigger demo notifications after 3 seconds
  Future.delayed(const Duration(seconds: 3), () async {
    await NotificationService.showRideBookingNotification();
    await NotificationService.showFoodDeliveryNotification();
    await NotificationService.showDoctorAppointmentReminder();
    await NotificationService.showMedicineReminderNotification();
    await NotificationService.showHairStyleBookingNotification();
    await NotificationService.showPaymentIssueNotification();
    await NotificationService.showNewFeatureUpdate();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Femivio',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (_) => const LoginScreen(),
        '/register': (_) => const RegisterScreen(),
        '/home': (_) => const HomeScreen(),
      },
    );
  }
}
