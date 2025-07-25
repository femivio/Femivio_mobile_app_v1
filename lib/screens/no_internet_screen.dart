import 'package:flutter/material.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.wifi_off, size: 80, color: Colors.redAccent),
            const SizedBox(height: 20),
            const Text(
              'No Internet Connection',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0d141c),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Please check your internet and try again.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF49739c)),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Restart the app by popping all and rebuilding
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const NoInternetScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Text(
                  'Try Again',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
