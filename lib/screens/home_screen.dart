import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ride_screen.dart';
import 'food_screen.dart';
import 'hotel_screen.dart';
import 'medicine_screen.dart';
import 'doctor_screen.dart';
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
      'label': 'Book Ride',
      'image': 'https://images.unsplash.com/photo-1606760726760-0d36c3f5e2cf?auto=format&fit=crop&w=400&q=80',
      'page': RideScreen(),
    },
    {
      'label': 'Food',
      'image': 'https://images.unsplash.com/photo-1600891964599-f61ba0e24092?auto=format&fit=crop&w=400&q=80',
      'page': FoodScreen(),
    },
    {
      'label': 'Hotel',
      'image': 'https://images.unsplash.com/photo-1551887373-6ccdb6f9724b?auto=format&fit=crop&w=400&q=80',
      'page': HotelScreen(),
    },
    {
      'label': 'Doctor',
      'image': 'https://images.unsplash.com/photo-1580281658629-33cbf7fdbb25?auto=format&fit=crop&w=400&q=80',
      'page': DoctorScreen(),
    },
    {
      'label': 'Medicine',
      'image': 'https://images.unsplash.com/photo-1588776814546-ec7e4d9af6f1?auto=format&fit=crop&w=400&q=80',
      'page': MedicineScreen(),
    },
    {
      'label': 'Hair Style',
      'image': 'https://images.unsplash.com/photo-1522336572468-97b06e8ef143?auto=format&fit=crop&w=400&q=80',
      'page': HairstyleScreen(),
    },
  ];



  final List<Map<String, dynamic>> bottomItems = [
    {'icon': Icons.home, 'label': 'Home'},
    {'icon': Icons.receipt_long, 'label': 'Bookings'},
    {'icon': Icons.account_balance_wallet, 'label': 'Wallet'},
    {'icon': Icons.support_agent, 'label': 'Support'},
    {'icon': Icons.person, 'label': 'Profile'},
  ];

  void _onTabTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  Widget _buildGreeting() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 20, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Color(0xFFE0D7F9),
                child: Icon(Icons.person, color: Colors.deepPurple),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, User 👋",
                    style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.deepPurple),
                      Text("Your City, India", style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[700])),
                    ],
                  )
                ],
              )
            ],
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.deepPurple),
            onPressed: () {
              // TODO: Add notification action
            },
          )
        ],
      ),
    );
  }

  Widget _buildBannerCard(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth - 32, // Full width minus horizontal margin
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      padding: const EdgeInsets.all(20),
      height: 180, // Increased height
      decoration: BoxDecoration(
        color: const Color(0xFFD6C9FF),
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: NetworkImage("https://cdn-icons-png.flaticon.com/512/1046/1046857.png"),
          alignment: Alignment.bottomRight,
          scale: 2.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Get 15% OFF",
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "On all bookings today",
            style: GoogleFonts.poppins(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryScroll() {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: services.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final item = services[index];

          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => item['page']),
            ),
            child: Container(
              width: 85,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple.withOpacity(0.15),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        item['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item['label'],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildServiceGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: services.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final item = services[index];
          return GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => item['page'])),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.08),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(item['image'], height: 50, width: 50),
                  const SizedBox(height: 10),
                  Text(
                    item['label'],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildGreeting(),
                _buildBannerCard(context),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Categories", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
                ),
                const SizedBox(height: 8),
                _buildCategoryScroll(),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Recommended", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
                ),
                const SizedBox(height: 12),
                _buildServiceGrid(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F1FB),
      body: _buildCurrentScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        unselectedLabelStyle: GoogleFonts.poppins(),
        items: bottomItems
            .map((item) => BottomNavigationBarItem(
          icon: Icon(item['icon']),
          label: item['label'],
        ))
            .toList(),
      ),
    );
  }
}
