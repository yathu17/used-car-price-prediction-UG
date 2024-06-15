// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/signin_page.dart';

// class SignupPage extends StatefulWidget {
//   const SignupPage({super.key});

//   @override
//   _SignupPageState createState() => _SignupPageState();
// }

// class _SignupPageState extends State<SignupPage> {
//   bool _isPasswordHidden = true;

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
//                 fit: BoxFit.fill,
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
//                   const SizedBox(height: 20),
//                   const Row(
//                     children: [
//                       Expanded(child: Divider()),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 10),
//                         child: Text(
//                           'Sign Up',
//                           style: TextStyle(
//                             fontSize: 30,
//                             color: Color.fromARGB(255, 2, 0, 36),
//                           ),
//                         ),
//                       ),
//                       Expanded(child: Divider()),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   TextField(
//                     decoration: InputDecoration(
//                       labelText: 'Name',
//                       hintText: 'Andrew',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
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
//                     obscureText: _isPasswordHidden,
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                       hintText: '*************',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _isPasswordHidden
//                               ? Icons.visibility_off
//                               : Icons.visibility,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             _isPasswordHidden = !_isPasswordHidden;
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const SignPage()));
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color.fromARGB(255, 2, 0, 36),
//                       padding: const EdgeInsets.symmetric(vertical: 15),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     child: const Center(
//                       child: Text(
//                         'Sign Up',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text("Already have an account? "),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const SignPage()));
//                         },
//                         child: const Text(
//                           'Sign In',
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
// }

import 'package:flutter/material.dart'; // Importing Flutter's material design package
import 'package:flutter_application_1/pages/signin_page.dart'; // Importing the SignInPage from your project

class SignupPage extends StatefulWidget {
  // Defining a stateful widget named SignupPage
  const SignupPage({super.key}); // Constructor for SignupPage, accepting a key

  @override
  _SignupPageState createState() =>
      _SignupPageState(); // Creating the state for SignupPage
}

class _SignupPageState extends State<SignupPage> {
  bool _isPasswordHidden = true; // Variable to manage password visibility

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
                fit: BoxFit.fill, // Filling the entire container with the image
              ),
            ),
          ),
          Align(
            // Aligning the child widget at the bottom center
            alignment: Alignment.bottomCenter,
            child: Container(
              // Container widget for the sign-up form
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
                  const SizedBox(height: 20), // Spacing between elements
                  const Row(
                    // Row widget to arrange elements horizontally
                    children: [
                      Expanded(child: Divider()), // Divider line
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Sign Up', // Sign-up label
                          style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 2, 0, 36),
                          ),
                        ),
                      ),
                      Expanded(child: Divider()), // Divider line
                    ],
                  ),
                  const SizedBox(height: 20), // Spacing between elements
                  TextField(
                    // TextField for name input
                    decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Andrew',
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                      ),
                    ),
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
                        _isPasswordHidden, // Obscuring the text for password
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
                          _isPasswordHidden
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordHidden =
                                !_isPasswordHidden; // Toggling password visibility
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Spacing between elements
                  ElevatedButton(
                    // Elevated button for the sign-up action
                    onPressed: () {
                      // Navigating to the SignInPage on button press
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
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
                        'Sign Up', // Button text
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Spacing between elements
                  Row(
                    // Row widget for the "Already have an account?" text
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Centering the row
                    children: [
                      const Text("Already have an account? "), // Static text
                      TextButton(
                        // TextButton for navigation to the sign-in page
                        onPressed: () {
                          // Navigating to the SignInPage on button press
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Sign In', // Button text
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
}
