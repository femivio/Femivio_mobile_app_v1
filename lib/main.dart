import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Femivio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey.shade200,
      ),
      home: const ConnectivityWrapper(),
    );
  }
}

class ConnectivityWrapper extends StatelessWidget {
  const ConnectivityWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
      stream: Connectivity().onConnectivityChanged,
      builder: (context, snapshot) {
        // While checking, show a loading indicator
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final result = snapshot.data;
        final isConnected = result != ConnectivityResult.none;

        return isConnected ? const LoginScreen() : const NoInternetScreen();
      },
    );
  }
}

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.wifi_off, size: 80, color: Colors.redAccent),
            const SizedBox(height: 16),
            const Text(
              'No Internet Connection',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Please check your connection and try again.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Force rebuild by popping and pushing
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const MyApp()),
                );
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
