// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/home_page.dart';
// import 'package:flutter_application_1/pages/signup_page.dart';

// class SignPage extends StatefulWidget {
//   const SignPage({super.key});

//   @override
//   _SignPageState createState() => _SignPageState();
// }

// class _SignPageState extends State<SignPage> {
//   bool _obscureText = true;

//   void _togglePasswordVisibility() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(
//                     'assets/bc_one.png'), // Replace with your image path
//                 fit: BoxFit.fitHeight,
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               padding: const EdgeInsets.all(20),
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30),
//                   topRight: Radius.circular(30),
//                 ),
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       _socialIconButton(
//                           'assets/google_logo.png'), // Replace with your Google icon path
//                       const SizedBox(width: 20),
//                       _socialIconButton(
//                           'assets/apple_logo.png'), // Replace with your Apple icon path
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   const Row(
//                     children: [
//                       Expanded(child: Divider()),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 10),
//                         child: Text('Or sign in with email'),
//                       ),
//                       Expanded(child: Divider()),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   TextField(
//                     decoration: InputDecoration(
//                       labelText: 'Email',
//                       hintText: 'example@gmail.com',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   TextField(
//                     obscureText: _obscureText,
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                       hintText: '*************',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _obscureText
//                               ? Icons.visibility_off
//                               : Icons.visibility,
//                         ),
//                         onPressed: _togglePasswordVisibility,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => HomePage()),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       primary: const Color.fromARGB(255, 2, 0, 36),
//                       padding: const EdgeInsets.symmetric(vertical: 15),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     child: const Center(
//                       child: Text(
//                         'Sign In',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   TextButton(
//                     onPressed: () {},
//                     child: const Text(
//                       'Forget Password?',
//                       style: TextStyle(color: Colors.green),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text("Don't have an account? "),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const SignupPage()),
//                           );
//                         },
//                         child: const Text(
//                           'Sign up',
//                           style: TextStyle(color: Colors.green),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _socialIconButton(String assetPath) {
//     return GestureDetector(
//       onTap: () {},
//       child: CircleAvatar(
//         radius: 30,
//         backgroundColor: Colors.grey[200],
//         child: Image.asset(
//           assetPath,
//           height: 30,
//           width: 30,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart'; // Importing Flutter's material design package
import 'package:flutter_application_1/pages/forget_password.dart';
import 'package:flutter_application_1/pages/home_page.dart'; // Importing the HomePage from your project
import 'package:flutter_application_1/pages/signup_page.dart'; // Importing the SignupPage from your project

class SignPage extends StatefulWidget {
  // Defining a stateful widget named SignPage
  const SignPage({super.key}); // Constructor for SignPage, accepting a key

  @override
  _SignPageState createState() =>
      _SignPageState(); // Creating the state for SignPage
}

class _SignPageState extends State<SignPage> {
  bool _obscureText = true; // Variable to manage password visibility

  void _togglePasswordVisibility() {
    // Method to toggle password visibility
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Building the widget tree
    return Scaffold(
      // Scaffold widget provides a structure for the visual interface
      body: Stack(
        // Stack widget allows for overlapping of widgets
        children: [
          Container(
            // Container widget to hold the background image
            decoration: const BoxDecoration(
              // BoxDecoration for setting the background image
              image: DecorationImage(
                image: AssetImage(
                    'assets/bc_one.png'), // Setting the background image
                fit: BoxFit
                    .fitHeight, // Filling the height of the container with the image
              ),
            ),
          ),
          Align(
            // Aligning the child widget at the bottom center
            alignment: Alignment.bottomCenter,
            child: Container(
              // Container widget for the sign-in form
              padding: const EdgeInsets.all(20), // Padding around the container
              decoration: const BoxDecoration(
                // BoxDecoration for styling the container
                color: Colors.white, // Background color of the container
                borderRadius: BorderRadius.only(
                  // Rounded corners at the top
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                // Column widget to arrange the form elements vertically
                mainAxisSize:
                    MainAxisSize.min, // Main axis size to take minimum space
                children: [
                  Row(
                    // Row widget to arrange elements horizontally
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Centering the row
                    children: [
                      _socialIconButton(
                          'assets/google_logo.png'), // Google sign-in button
                      const SizedBox(width: 20), // Spacing between buttons
                      _socialIconButton(
                          'assets/apple_logo.png'), // Apple sign-in button
                    ],
                  ),
                  const SizedBox(height: 20), // Spacing between elements
                  const Row(
                    // Row widget for the "Or sign in with email" text
                    children: [
                      Expanded(child: Divider()), // Divider line
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text('Or sign in with email'), // Static text
                      ),
                      Expanded(child: Divider()), // Divider line
                    ],
                  ),
                  const SizedBox(height: 20), // Spacing between elements
                  TextField(
                    // TextField for email input
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'example@gmail.com',
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Spacing between elements
                  TextField(
                    // TextField for password input
                    obscureText:
                        _obscureText, // Obscuring the text for password
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: '*************',
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                      ),
                      suffixIcon: IconButton(
                        // Suffix icon button to toggle password visibility
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed:
                            _togglePasswordVisibility, // Toggling password visibility
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Spacing between elements
                  ElevatedButton(
                    // Elevated button for the sign-in action
                    onPressed: () {
                      // Navigating to the HomePage on button press
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(
                          255, 2, 0, 36), // Button background color
                      padding: const EdgeInsets.symmetric(
                          vertical: 15), // Button padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Sign In', // Button text
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Spacing between elements
                  TextButton(
                    // TextButton for the "Forget Password?" action
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetPasswordPage()));
                    },
                    child: const Text(
                      'Forget Password?', // Button text
                      style: TextStyle(color: Colors.green), // Text color
                    ),
                  ),
                  const SizedBox(height: 20), // Spacing between elements
                  Row(
                    // Row widget for the "Don't have an account?" text
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Centering the row
                    children: [
                      const Text("Don't have an account? "), // Static text
                      TextButton(
                        // TextButton for navigation to the sign-up page
                        onPressed: () {
                          // Navigating to the SignupPage on button press
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupPage()),
                          );
                        },
                        child: const Text(
                          'Sign up', // Button text
                          style: TextStyle(color: Colors.green), // Text color
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialIconButton(String assetPath) {
    // Widget for social media sign-in buttons
    return GestureDetector(
      onTap: () {}, // On tap action (currently empty)
      child: CircleAvatar(
        radius: 30, // Size of the circle avatar
        backgroundColor: Colors.grey[200], // Background color of the avatar
        child: Image.asset(
          assetPath, // Path to the social media icon image
          height: 30,
          width: 30,
        ),
      ),
    );
  }
}
