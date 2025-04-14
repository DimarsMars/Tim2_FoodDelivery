import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText = true;
  bool _obscureConfirmPassword = true;

  Widget _inputkolom({
    required String labelText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5),
        TextField(
          style: TextStyle(color: Colors.black, fontSize: 16),
          decoration: InputDecoration(
              labelText: labelText,
              hintStyle: TextStyle(color: Colors.grey),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        )
      ],
    );
  }

  Widget _inputpass({
    required String labelText,
    required bool obscureText,
    required VoidCallback toggleVisibility,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5),
        TextField(
          obscureText: obscureText,
          style: TextStyle(color: Colors.black, fontSize: 16),
          decoration: InputDecoration(
            labelText: labelText,
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            suffixIcon: IconButton(
              onPressed: toggleVisibility,
              icon: Icon(
                obscureText ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            'assets/background_welcome_page.png',
            fit: BoxFit.cover,
          )),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/food_delivery.png',
                      width: 150,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Create an Account',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    _inputkolom(labelText: 'Nama Lengkap'),
                    _inputkolom(labelText: 'Email'),
                    _inputkolom(labelText: 'Phone Number'),
                    _inputpass(
                        labelText: 'Password',
                        obscureText: _obscureText,
                        toggleVisibility: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        }),
                    _inputpass(
                        labelText: 'Confirm Password',
                        obscureText: _obscureConfirmPassword,
                        toggleVisibility: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        }),
                    SizedBox(height: 30),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            minimumSize: Size(330, 45),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17))),
                        onPressed: () {},
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 255, 228, 132),
                              fontWeight: FontWeight.bold),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Do You have an Account? '),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context); // kembali ke login
                          },
                          child: Text(
                            'Back to Login',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 114, 33, 243),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}