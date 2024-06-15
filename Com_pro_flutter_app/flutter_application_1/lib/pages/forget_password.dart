import 'package:flutter/material.dart'; // Importing Flutter's material design package
import 'package:flutter_application_1/pages/signin_page.dart'; // Importing the SignInPage from your project

class ForgetPasswordPage extends StatefulWidget {
  // Defining a stateful widget named ForgetPasswordPage
  const ForgetPasswordPage(
      {super.key}); // Constructor for ForgetPasswordPage, accepting a key

  @override
  _ForgetPasswordPageState createState() =>
      _ForgetPasswordPageState(); // Creating the state for ForgetPasswordPage
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  bool _isPasswordHidden = true; // Variable to manage password visibility

  @override
  Widget build(BuildContext context) {
    // Building the widget tree
    return Scaffold(
      appBar: AppBar(
        // AppBar widget at the top of the screen
        backgroundColor: const Color.fromARGB(
            255, 2, 0, 36), // Background color of the AppBar
        title: const Text(
          "Forget Password", // Title of the AppBar
          style: TextStyle(
              color: Colors.white, fontSize: 20), // Text style for the title
        ),
        leading: IconButton(
          // Leading icon button to navigate back
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SignPage()), // Navigation to the SignInPage
            );
          },
          icon: const Icon(
            Icons.arrow_back, // Back arrow icon
            color: Colors.white, // Icon color
          ),
        ),
      ),
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
              // Container widget for the form
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
                    // Row widget for the "Sign Up" text
                    children: [
                      Expanded(child: Divider()), // Divider line
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Sign Up', // Static text
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
                    // TextField for new password input
                    obscureText:
                        _isPasswordHidden, // Obscuring the text for password
                    decoration: InputDecoration(
                      labelText: 'New Password',
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
                  TextField(
                    // TextField for confirm new password input
                    obscureText:
                        _isPasswordHidden, // Obscuring the text for password
                    decoration: InputDecoration(
                      labelText: 'Confirm New Password',
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
                    // Elevated button for the "Create New Password" action
                    onPressed: () {
                      // Navigating to the SignInPage on button press
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignPage()),
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
                        'Create New Password', // Button text
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Spacing between elements
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
