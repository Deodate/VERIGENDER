import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [Colors.pink, Colors.blue],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds);
                  },
                  child: Text(
                    'Welcome to Verigender',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Times New Roman', // Font family applied
                      color: Colors.white, // Required for ShaderMask to work
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'If you have a Verigender Account,\nlog in with your email or phone number.',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black54,
                    fontFamily: 'Times New Roman', // Font family applied
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 62.0),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email or phone number',
                    hintStyle: TextStyle(fontFamily: 'Times New Roman'), // Font family applied
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email or phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(fontFamily: 'Times New Roman'), // Font family applied
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle login logic here
                      print('Email: ${_emailController.text}');
                      print('Password: ${_passwordController.text}');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black45,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: Text(
                    'Log In',
                    style: TextStyle(fontFamily: 'Times New Roman'), // Font family applied
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Handle sign-up logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontFamily: 'Times New Roman'), // Font family applied
                  ),
                ),
                SizedBox(height: 24.0),
                TextButton(
                  onPressed: () {
                    // Navigate to "Find Verigender Account or Password" page
                  },
                  child: const Text(
                    'Find Verigender Account or Password',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black54,
                      fontFamily: 'Times New Roman', // Font family applied
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
