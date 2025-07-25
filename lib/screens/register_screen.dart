import 'package:flutter/material.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _register() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    // TODO: Handle registration logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Registered Successfully")),
    );

    Navigator.pop(context); // Back to login screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  offset: const Offset(6, 6),
                  blurRadius: 20,
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(-6, -6),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.person_add_alt_1, size: 72, color: Colors.deepPurple),
                const SizedBox(height: 16),
                const Text(
                  "Create Account",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 10,
                  ),
                  child: const Text("Register", style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Navigate back to login
                  },
                  child: const Text("Already have an account? Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
