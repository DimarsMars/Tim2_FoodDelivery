import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/background_welcome_page.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 50),
                  Center(
                    child: Image.asset(
                      'assets/food_delivery.png',
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 40),
                  CupertinoTextField(
                    controller: emailController,
                    placeholder: 'Email',
                    padding: const EdgeInsets.all(16),
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: CupertinoColors.black),
                    decoration: BoxDecoration(
                      color: CupertinoColors.white,
                      border: Border.all(color: CupertinoColors.systemGrey2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CupertinoTextField(
                    controller: passwordController,
                    placeholder: 'Password',
                    obscureText: _obscurePassword,
                    padding: const EdgeInsets.all(16),
                    keyboardType: TextInputType.visiblePassword,
                    style: const TextStyle(color: CupertinoColors.black),
                    suffix: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      child: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: CupertinoColors.white,
                      border: Border.all(color: CupertinoColors.systemGrey2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(height: 30),
                  CupertinoButton(
                    color: const Color(0xFF4CAF50),
                    borderRadius: BorderRadius.circular(12),
                    child: const Text(
                      "Login",
                      style: TextStyle(color: CupertinoColors.white),
                    ),
                    onPressed: () {
                      final email = emailController.text;
                      final password = passwordController.text;
                      print("Email: $email");
                      print("Password: $password");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  CupertinoButton(
                    child: const Text("Don't have an account? Sign up"),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
