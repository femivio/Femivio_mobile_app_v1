import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'ride_screen.dart';
import 'food_screen.dart';
import 'hotel_screen.dart';
import 'doctor_screen.dart';
import 'medicine_screen.dart';
import 'hair_screen.dart';
import 'my_booking_screen.dart';
import 'wallet_screen.dart';
import 'support_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final String userName = "Prakash";

  final List<String> poemWords = ["Dream", "Ride", "Dine", "Heal", "Shine"];

  final List<Map<String, dynamic>> services = [
    {
      "label": "Book Ride",
      "icon": Icons.pedal_bike_rounded,
      "page": const RideScreen(),
      "color": const Color(0xFFE0E7FF),
    },
    {
      "label": "Food Booking",
      "icon": Icons.restaurant_menu_rounded,
      "page": const FoodScreen(),
      "color": const Color(0xFFFFF5E5),
    },
    {
      "label": "Hotel Booking",
      "icon": Icons.hotel_rounded,
      "page": const HotelScreen(),
      "color": const Color(0xFFE6FFFA),
    },
    {
      "label": "Consult Doctor",
      "icon": Icons.local_hospital_rounded,
      "page": const DoctorScreen(),
      "color": const Color(0xFFFFEBEE),
    },
    {
      "label": "Order Medicine",
      "icon": Icons.medication_rounded,
      "page": const MedicineScreen(),
      "color": const Color(0xFFE8F5E9),
    },
    {
      "label": "Hair Style",
      "icon": Icons.content_cut_rounded,
      "page": const HairStyleScreen(),
      "color": const Color(0xFFFFF3E0),
    },
  ];

  final List<Map<String, dynamic>> _bottomItems = [
    {'icon': Icons.home, 'label': 'Home'},
    {'icon': Icons.receipt_long, 'label': 'My Booking'},
    {'icon': Icons.account_balance_wallet, 'label': 'Wallet'},
    {'icon': Icons.support_agent, 'label': 'Support'},
    {'icon': Icons.person, 'label': 'Profile'},
  ];

  void _onTabTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  Widget _buildServiceCard(Map<String, dynamic> service) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => service['page']),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: service['color'],
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: const Offset(0, 6),
              blurRadius: 12,
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(service['icon'], size: 40, color: Colors.deepPurple),
            const SizedBox(height: 12),
            Text(
              service['label'],
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.deepPurple.shade800,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple.shade100, Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome, $userName!",
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "Explore services crafted for your lifestyle.",
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.deepPurple.shade700,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: poemWords
                .map((word) => Chip(
              label: Text(
                word,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: Colors.deepPurple,
                ),
              ),
              backgroundColor: Colors.deepPurple.shade100,
            ))
                .toList(),
          )
        ],
      ),
    );
  }

  Widget _buildHomeBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 12),
          _buildHeroBanner(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: services.map(_buildServiceCard).toList(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Femivio',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded,
                color: Colors.deepPurple),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("No new notifications")),
              );
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildHomeBody(),
          const MyBookingScreen(),
          const WalletScreen(),
          const SupportScreen(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: _bottomItems
            .map((item) => BottomNavigationBarItem(
          icon: Icon(item['icon']),
          label: item['label'],
        ))
            .toList(),
      ),
    );
  }
}