import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter both email and password")),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Hero Banner
            Container(
              height: 280,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuCqqph72f0iPafUx1ym2dStSTBKWK3q3CVeYYCoxakuIlDWgkUG4adXw1jF4bi72Bp-wP7IUQnRK0Th0_bDMrNnHmqICFvWkx7KdOmnBvuIKAmIUzxIGxy2W7L0Tkc79ss5Vj6Xq2uwaw4kAf0VA57MNtDES2cq3F4hFX7kKOE8EqPONqfN9P_5r_YOuLDjKtk6RlCxLV_Jpo4NlcLKXkfnl8dMcLlrNvaLpUoYyjZDpZFidsYBeEJ5qzUKco_0qS9iAkU141QUaqgD',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Welcome Heading
            const Text(
              "Welcome to Femivio",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D0F1C),
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16),

            /// Input Fields
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "Email or Phone",
                      filled: true,
                      fillColor: const Color(0xFFE6E9F4),
                      contentPadding: const EdgeInsets.all(18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      hintStyle: const TextStyle(
                        color: Color(0xFF47569E),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      filled: true,
                      fillColor: const Color(0xFFE6E9F4),
                      contentPadding: const EdgeInsets.all(18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      hintStyle: const TextStyle(
                        color: Color(0xFF47569E),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  /// Login Button
                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF607AFB),
                      foregroundColor: const Color(0xFFF8F9FC),
                      minimumSize: const Size.fromHeight(48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// Sign Up Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const RegisterScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE6E9F4),
                  foregroundColor: const Color(0xFF0D0F1C),
                  minimumSize: const Size.fromHeight(48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),

            /// Terms
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
              child: Text(
                "By continuing, you agree to our Terms of Service and Privacy Policy",
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF47569E),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
