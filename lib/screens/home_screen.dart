import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  final List<Map<String, dynamic>> services = [
    {
      "label": "Ride Service",
      "image": "assets/images/Bike.png", // Replace with working image
      "page": const RideScreen(),
    },
    {
      "label": "Food Ordering",
      "image": "https://example.com/food.jpg",
      "page": const FoodScreen(),
    },
    {
      "label": "Hotel Booking",
      "image": "https://example.com/hotel.jpg",
      "page": const HotelScreen(),
    },
    {
      "label": "Medicine Booking",
      "image": "https://example.com/medicine.jpg",
      "page": const MedicineScreen(),
    },
    {
      "label": "Doctor Consultation",
      "image": "https://example.com/doctor.jpg",
      "page": const DoctorScreen(),
    },
    {
      "label": "Hair Styling",
      "image": "https://example.com/hair.jpg",
      "page": const HairstyleScreen(),
    },
  ];

  final List<Map<String, dynamic>> _bottomItems = [
    {'icon': Icons.home, 'label': 'Home'},
    {'icon': Icons.receipt_long, 'label': 'Bookings'},
    {'icon': Icons.account_balance_wallet, 'label': 'Wallet'},
    {'icon': Icons.support_agent, 'label': 'Support'},
    {'icon': Icons.person, 'label': 'Profile'},
  ];

  void _onTabTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFE7EDF4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Color(0xFF49739C)),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search for services",
                hintStyle: TextStyle(color: Color(0xFF49739C)),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => item['page']),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                item['image'],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/images/placeholder.png', fit: BoxFit.cover);
                },
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            item['label'],
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: const Color(0xFF0D141C),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHomeContent() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const SizedBox(height: 12),
        _buildSearchBar(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Text(
            "Quick Access",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: const Color(0xFF0D141C),
            ),
          ),
        ),
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
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildCurrentScreen() {
    switch (_selectedIndex) {
      case 1:
        return const MyBookingScreen();
      case 2:
        return const WalletScreen();
      case 3:
        return const SupportScreen();
      case 4:
        return const ProfileScreen();
      default:
        return _buildHomeContent();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF3F3F3),
        title: const Text("Home", style: TextStyle(color: Color(0xFF0D141C))),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            child: ClipOval(
              child: Image.network(
                "https://example.com/profile.jpg",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset("assets/images/placeholder.png", fit: BoxFit.cover);
                },
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Color(0xFF0D141C)),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("No new notifications")),
              );
            },
          )
        ],
      ),
      body: _buildCurrentScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
        selectedItemColor: const Color(0xFF0D141C),
        unselectedItemColor: const Color(0xFF49739C),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFF3F3F3),
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
