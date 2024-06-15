// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/splash_page.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: SplashScreen(),
//     );
//   }
// }

import 'package:flutter/material.dart'; // Importing Flutter's material design package
import 'package:flutter_application_1/pages/splash_page.dart'; // Importing the SplashScreen page from your project

void main() {
  // Entry point of the Flutter application
  runApp(const MyApp()); // Running the MyApp widget
}

class MyApp extends StatelessWidget {
  // Defining a stateless widget named MyApp
  const MyApp({super.key}); // Constructor for MyApp, accepting a key

  @override
  Widget build(BuildContext context) {
    // Building the widget tree
    return MaterialApp(
      // MaterialApp widget is the root of the application
      title: 'Flutter Demo', // Title of the application
      theme: ThemeData(
        // Theme data for the application
        colorScheme: ColorScheme.fromSeed(
            seedColor:
                Colors.deepPurple), // Setting color scheme with a seed color
        useMaterial3: true, // Opting in to use Material Design 3
      ),
      home:
          SplashScreen(), // Setting the SplashScreen widget as the home screen of the app
    );
  }
}
