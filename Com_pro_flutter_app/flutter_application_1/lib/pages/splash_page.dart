// import 'package:flutter/material.dart';
// import 'dart:async';

// import 'package:flutter_application_1/pages/signin_page.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(const Duration(seconds: 3), () {
//       // Navigate to the main screen after 3 seconds
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => const SignPage()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/Spbc.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart'; // Importing Flutter's material design package
import 'dart:async'; // Importing Dart's asynchronous programming package

import 'package:flutter_application_1/pages/signin_page.dart'; // Importing the SignInPage from your project

class SplashScreen extends StatefulWidget {
  // Defining a stateful widget named SplashScreen
  const SplashScreen(
      {super.key}); // Constructor for SplashScreen, accepting a key

  @override
  _SplashScreenState createState() =>
      _SplashScreenState(); // Creating the state for SplashScreen
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // Initialization method called when the state is created
    super.initState();
    Timer(const Duration(seconds: 3), () {
      // Setting a timer to navigate to the SignInPage after 3 seconds
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => const SignPage()), // Navigation to SignInPage
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Building the widget tree
    return Scaffold(
      // Scaffold widget provides a structure for the visual interface
      body: Container(
        // Container widget to hold the splash screen background
        decoration: const BoxDecoration(
          // BoxDecoration for setting the background image
          image: DecorationImage(
            image:
                AssetImage('assets/Spbc.png'), // Setting the background image
            fit: BoxFit.cover, // Covering the entire screen with the image
          ),
        ),
      ),
    );
  }
}
