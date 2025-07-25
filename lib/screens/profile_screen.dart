import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle sectionTitleStyle = GoogleFonts.plusJakartaSans(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: const Color(0xFF0D0F1C),
    );

    TextStyle titleStyle = GoogleFonts.plusJakartaSans(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF0D0F1C),
    );

    TextStyle subtitleStyle = GoogleFonts.notoSans(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: const Color(0xFF47569E),
    );

    Widget sectionItem({
      required IconData icon,
      required String title,
      required String subtitle,
    }) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Row(
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFE6E9F4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: const Color(0xFF0D0F1C)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: titleStyle),
                  Text(subtitle, style: subtitleStyle),
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FC),
        elevation: 0,
        title: Text("Settings", style: titleStyle),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0D0F1C)),
          onPressed: () => Navigator.of(context).pop(), // ✅ Works if pushed
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Account", style: sectionTitleStyle),
            ),
          ),
          sectionItem(
            icon: Icons.person_outline,
            title: "Account Details",
            subtitle: "Manage your account details",
          ),
          sectionItem(
            icon: Icons.credit_card,
            title: "Payment Methods",
            subtitle: "Manage your payment methods",
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Preferences", style: sectionTitleStyle),
            ),
          ),
          sectionItem(
            icon: Icons.notifications_none,
            title: "Notifications",
            subtitle: "Manage your notification preferences",
          ),
          sectionItem(
            icon: Icons.language,
            title: "Language",
            subtitle: "Choose your preferred language",
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Privacy", style: sectionTitleStyle),
            ),
          ),
          sectionItem(
            icon: Icons.shield_outlined,
            title: "Privacy Settings",
            subtitle: "Manage your privacy settings",
          ),
        ],
      ),
    );
  }
}
