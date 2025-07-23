import 'package:flutter/material.dart';

class RideScreen extends StatelessWidget {
  const RideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book a Ride"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Select Service"),
            _buildServiceOptions(),
            const SizedBox(height: 20),
            _buildSectionTitle("Pickup Location"),
            _buildTextField("Enter pickup location"),
            const SizedBox(height: 20),
            _buildSectionTitle("Drop Location"),
            _buildTextField("Enter drop location"),
            const SizedBox(height: 20),
            _buildSectionTitle("Pickup Date & Time"),
            _buildTextField("Choose date and time"),
            const SizedBox(height: 20),
            _buildSectionTitle("Vehicle Type"),
            _buildVehicleOptions(),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {},
                child: const Text(
                  "Book Now",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  Widget _buildServiceOptions() {
    final services = [
      "Pickup & Drop",
      "Cab Trip",
      "Bike Rent",
      "Outstation Trip",
    ];
    return Wrap(
      spacing: 10,
      children: services.map((service) => _buildChip(service)).toList(),
    );
  }

  Widget _buildVehicleOptions() {
    final types = ["Bike", "Auto", "Cab", "SUV", "Luxury Car"];
    return Wrap(
      spacing: 10,
      children: types.map((type) => _buildOutlinedChip(type)).toList(),
    );
  }

  Widget _buildChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.deepPurple.shade100,
      labelStyle: const TextStyle(color: Colors.deepPurple),
    );
  }

  Widget _buildOutlinedChip(String label) {
    return Chip(
      label: Text(label),
      shape: StadiumBorder(
        side: BorderSide(
          color: Colors.deepPurple,
        ),
      ),
      labelStyle: const TextStyle(color: Colors.deepPurple),
      backgroundColor: Colors.white,
    );
  }
}
