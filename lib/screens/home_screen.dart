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
      "label": "Ride",
      "image": "https://cdn-icons-png.flaticon.com/512/854/854894.png",
      "color": Colors.blue,
      "page": const RideScreen(),
    },
    {
      "label": "Food",
      "image": "https://cdn-icons-png.flaticon.com/512/3075/3075977.png",
      "color": Colors.orange,
      "page": const FoodScreen(),
    },
    {
      "label": "Hotel",
      "image": "https://cdn-icons-png.flaticon.com/512/2972/2972638.png",
      "color": Colors.indigo,
      "page": const HotelScreen(),
    },
    {
      "label": "Medicine",
      "image": "https://cdn-icons-png.flaticon.com/512/899/899765.png",
      "color": Colors.green,
      "page": const MedicineScreen(),
    },
    {
      "label": "Doctors",
      "image": "https://cdn-icons-png.flaticon.com/512/3774/3774299.png",
      "color": Colors.red,
      "page": const DoctorScreen(),
    },
    {
      "label": "Beauty",
      "image": "https://cdn-icons-png.flaticon.com/512/3714/3714453.png",
      "color": Colors.pink,
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
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search services",
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(Map<String, dynamic> item) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => item['page']));
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 4)),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: item['color'].withOpacity(0.15),
              radius: 30,
              child: Image.network(
                item['image'],
                width: 30,
                height: 30,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              item['label'],
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: const Color(0xFF333333),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeContent() {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
          SliverToBoxAdapter(child: _buildSearchBar()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Text(
                "Quick Access",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: const Color(0xFF333333),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.0,
              children: services.map(_buildServiceCard).toList(),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
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
      backgroundColor: const Color(0xFFF8F6FC),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF8F6FC),
        centerTitle: true,
        title: Text("Femivio",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF333333),
            )),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.network(
                "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Color(0xFF333333)),
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
        selectedItemColor: const Color(0xFF6A1B9A),
        unselectedItemColor: const Color(0xFF888888),
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
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
