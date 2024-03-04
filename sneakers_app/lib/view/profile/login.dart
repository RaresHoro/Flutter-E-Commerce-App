import 'package:flutter/material.dart';
import 'package:sneakers_app/utils/constants.dart';
import 'package:sneakers_app/view/profile/profile_screen.dart';
import 'package:sneakers_app/view/profile/signup.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: customAppBarProfile(context),
        body: LoginSignupForm(onNavigateToProfile: () {
          // Navigate to the Profile page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Profile()),
          );
        }),
      ),
    );
  }
}

class LoginSignupForm extends StatefulWidget {
  final VoidCallback onNavigateToProfile;

  const LoginSignupForm({Key? key, required this.onNavigateToProfile})
      : super(key: key);

  @override
  _LoginSignupFormState createState() => _LoginSignupFormState();
}

class _LoginSignupFormState extends State<LoginSignupForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _obscurePassword = true;

  void _login() {
    // Perform your login logic here

    // For demonstration purposes, let's assume a successful login
    bool loginSuccess = true;

    if (loginSuccess) {
      // Call the callback to navigate to the Profile page
      widget.onNavigateToProfile();
    } else {
      // Handle failed login
      // Show error message or perform other actions
    }
  }

  void _signup() {
    // Implement your signup logic here

    // For demonstration purposes, let's assume a successful signup
    bool signupSuccess = true;

    if (signupSuccess) {
      // Call the callback to navigate to the Profile page
      widget.onNavigateToProfile();
    } else {
      // Handle failed signup
      // Show error message or perform other actions
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _goToSignupPage() {
    // Navigate to the Signup page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Username/Email',
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              labelText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: _togglePasswordVisibility,
              ),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _login,
            child: Text('Login'),
          ),
          SizedBox(height: 8), // Adjusted height for spacing
          TextButton(
            onPressed: _goToSignupPage, // Updated onPressed function
            child: Text("New here? Sign up to our website"),
          ),
          SizedBox(height: 8), // Added space
          ElevatedButton(
            onPressed: widget.onNavigateToProfile,
            child: Text('Go to Profile'),
          ),
        ],
      ),
    );
  }
}

PreferredSizeWidget customAppBarProfile(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(60.0),
    child: AppBar(
      backgroundColor: AppConstantsColor.backgroundColor,
      title: Text(
        'Login',
        style: TextStyle(color: Colors.black),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),
  );
}
