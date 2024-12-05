import 'package:flutter/material.dart';
import '../widgets/custom_header.dart'; // Import the custom header
import 'home_page.dart'; // Import HomePage for navigation

class LoginPage extends StatelessWidget {
  // Controllers for the text fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomHeader(), // Add the custom header at the top
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: _emailController, // Attach controller to the email field
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    controller: _passwordController, // Attach controller to the password field
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Perform validation before navigating
                      String email = _emailController.text;
                      String password = _passwordController.text;

                      if (email.isEmpty || password.isEmpty) {
                        // Show a message if either field is empty
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Email and Password cannot be empty')),
                        );
                      } else {
                        // Navigate to the homepage if both fields are filled
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      }
                    },
                    child: Text('Login'),
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
