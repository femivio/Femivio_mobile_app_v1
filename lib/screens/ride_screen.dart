import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RideScreen extends StatelessWidget {
  const RideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1F5F9),
        elevation: 0,
        title: Text(
          "Ride",
          style: GoogleFonts.plusJakartaSans(
            color: const Color(0xFF0D141C),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _searchBar(),
          Expanded(child: _mapSection()),
          _rideOptions(),
          _bookRideButton(),
          const SizedBox(height: 10),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: const Color(0xFFF1F5F9),
      //   selectedItemColor: const Color(0xFF0D141C),
      //   unselectedItemColor: const Color(0xFF49739C),
      //   currentIndex: 0, // Keep this static, non-functional
      //   type: BottomNavigationBarType.fixed,
      //   onTap: null, // Disabled tap
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //     BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: "Services"),
      //     BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Bookings"),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      //   ],
      // ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0xFFE7EDF4),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Icon(Icons.search, color: Color(0xFF49739C)),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Where to?",
                  border: InputBorder.none,
                  hintStyle: GoogleFonts.plusJakartaSans(
                    color: const Color(0xFF49739C),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mapSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: NetworkImage(
              "https://lh3.googleusercontent.com/aida-public/AB6AXuAtk8oEZALkX4X5E2WZUXatAf0cPKp7uHNgvfEYdykeNIotQw3LvjmpeJCrM4pDguGrJgF9buV742olgc4ZrUx5v9NFc2mi6lXZ7QnZxKbfBBz2flWGM2kuKBmZNYb1SbURTOCgKVHHKQpQIJe5dx84WqZLfEVidneB9nmc9w-tcmoXuno_M68nSWaEkNpaPtDwEkXChYfChNKL_FoGjisDomzKx7S9-BQG-6IdB8lzs0xOBuilB7edU2t-q0EFNXeU6-eDp1yQkNgI"),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _iconBtn(Icons.add),
              _iconBtn(Icons.remove),
              const SizedBox(height: 8),
              _iconBtn(Icons.navigation),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconBtn(IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black),
        onPressed: () {},
      ),
    );
  }

  Widget _rideOptions() {
    final options = [
      {'type': 'Economy', 'time': '4 min', 'price': '\$12.50'},
      {'type': 'Premium', 'time': '6 min', 'price': '\$18.75'},
      {'type': 'Luxury', 'time': '8 min', 'price': '\$25.00'},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Choose a ride",
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: const Color(0xFF0D141C),
            ),
          ),
        ),
        const SizedBox(height: 10),
        ...options.map((ride) => _rideCard(ride)).toList(),
      ],
    );
  }

  Widget _rideCard(Map<String, String> ride) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Color(0xFFE7EDF4),
                child: Icon(Icons.directions_car, color: Color(0xFF0D141C)),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ride['type']!,
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF0D141C),
                    ),
                  ),
                  Text(
                    ride['time']!,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12,
                      color: const Color(0xFF49739C),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            ride['price']!,
            style: GoogleFonts.plusJakartaSans(
              color: const Color(0xFF0D141C),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bookRideButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0C7FF2),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          elevation: 6,
        ),
        child: Text(
          "Book Ride",
          style: GoogleFonts.plusJakartaSans(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
