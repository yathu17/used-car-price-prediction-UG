// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/option_page.dart';
// import 'package:flutter_application_1/pages/signin_page.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Grid View Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const GridViewScreen(),
//     );
//   }
// }

// class GridViewScreen extends StatelessWidget {
//   const GridViewScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             title: const Text('Menu'),
//             titleTextStyle: const TextStyle(color: Colors.white, fontSize: 25),
//             backgroundColor: const Color.fromARGB(255, 2, 0, 36),
//             actions: <Widget>[
//               IconButton(
//                   icon: const Icon(
//                     Icons.logout,
//                     color: Colors.white,
//                   ),
//                   tooltip: 'Show Snackbar',
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const SignPage()));
//                   })
//             ]),
//         body: Container(
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('assets/menu_bc.png'),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: GridView(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 10.0,
//                 mainAxisSpacing: 10.0,
//               ),
//               children: [
//                 _buildGridItem(
//                   context,
//                   'Predict prices',
//                   'assets/price.png',
//                   const OptionPage(),
//                 ),
//                 _buildGridItem(context, 'History', 'assets/history.png',
//                     const OptionPage()),
//                 _buildGridItem(
//                     context, 'Saved', 'assets/saved.png', const OptionPage()),
//                 _buildGridItem(context, 'Settings', 'assets/setting.png',
//                     const OptionPage()),
//                 _buildGridItem(context, 'Disable', 'assets/disabled.png',
//                     const OptionPage()),
//                 _buildGridItem(context, 'Profile', 'assets/profile.png',
//                     const OptionPage()),
//               ],
//             ),
//           ),
//         ));
//   }

//   Widget _buildGridItem(
//       BuildContext context, String title, String imagePath, Widget page) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => page),
//         );
//       },
//       child: Column(
//         children: [
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.grey[800],
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10.0),
//                 child: Image.asset(
//                   imagePath,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 8.0),
//           Text(
//             title,
//             style: const TextStyle(
//                 fontSize: 25.0,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart'; // Importing Flutter's material design package
import 'package:flutter_application_1/pages/option_page.dart'; // Importing the OptionPage from your project
import 'package:flutter_application_1/pages/signin_page.dart'; // Importing the SignInPage from your project

class HomePage extends StatelessWidget {
  // Defining a stateless widget named HomePage
  const HomePage({super.key}); // Constructor for HomePage, accepting a key

  @override
  Widget build(BuildContext context) {
    // Building the widget tree
    return MaterialApp(
      // MaterialApp widget is the root of the application
      title: 'Grid View Demo', // Title of the application
      theme: ThemeData(
        // Theme data for the application
        primarySwatch: Colors.blue, // Primary swatch color
      ),
      home: const GridViewScreen(), // Setting GridViewScreen as the home screen
    );
  }
}

class GridViewScreen extends StatelessWidget {
  // Defining a stateless widget named GridViewScreen
  const GridViewScreen(
      {super.key}); // Constructor for GridViewScreen, accepting a key

  @override
  Widget build(BuildContext context) {
    // Building the widget tree
    return Scaffold(
      // Scaffold widget provides a structure for the visual interface
      appBar: AppBar(
        // AppBar widget at the top of the screen
        title: const Text('Menu'), // Title of the AppBar
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 25), // Text style for the title
        backgroundColor: const Color.fromARGB(
            255, 2, 0, 36), // Background color of the AppBar
        actions: <Widget>[
          // Actions in the AppBar
          IconButton(
            icon: const Icon(
              Icons.logout, // Logout icon
              color: Colors.white, // Icon color
            ),
            tooltip: 'Show Snackbar', // Tooltip for the icon button
            onPressed: () {
              // Navigation to the SignInPage on button press
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        // Container widget to hold the background image
        decoration: const BoxDecoration(
          // BoxDecoration for setting the background image
          image: DecorationImage(
            image: AssetImage(
                'assets/menu_bc.png'), // Setting the background image
            fit: BoxFit.cover, // Covering the entire container with the image
          ),
        ),
        child: Padding(
          // Padding around the container
          padding: const EdgeInsets.all(8.0),
          child: GridView(
            // GridView widget to display grid items
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of items per row
              crossAxisSpacing: 10.0, // Spacing between columns
              mainAxisSpacing: 10.0, // Spacing between rows
            ),
            children: [
              _buildGridItem(
                context,
                'Predict prices',
                'assets/price.png',
                const OptionPage(), // Grid item for "Predict prices"
              ),
              _buildGridItem(
                context,
                'History',
                'assets/history.png',
                const OptionPage(), // Grid item for "History"
              ),
              _buildGridItem(
                context,
                'Saved',
                'assets/saved.png',
                const OptionPage(), // Grid item for "Saved"
              ),
              _buildGridItem(
                context,
                'Settings',
                'assets/setting.png',
                const OptionPage(), // Grid item for "Settings"
              ),
              _buildGridItem(
                context,
                'Disable',
                'assets/disabled.png',
                const OptionPage(), // Grid item for "Disable"
              ),
              _buildGridItem(
                context,
                'Profile',
                'assets/profile.png',
                const OptionPage(), // Grid item for "Profile"
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(
    BuildContext context,
    String title,
    String imagePath,
    Widget page,
  ) {
    // Widget to build individual grid items
    return GestureDetector(
      onTap: () {
        // Navigation to the specified page on tap
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Column(
        children: [
          Expanded(
            // Expanded widget to take available space
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[800], // Background color of the container
                borderRadius: BorderRadius.circular(10.0), // Rounded corners
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    10.0), // Clipping the image to rounded corners
                child: Image.asset(
                  imagePath, // Image for the grid item
                  fit: BoxFit.cover, // Covering the container with the image
                ),
              ),
            ),
          ),
          const SizedBox(height: 8.0), // Spacing between elements
          Text(
            title, // Title of the grid item
            style: const TextStyle(
              fontSize: 25.0, // Font size
              color: Colors.white, // Text color
              fontWeight: FontWeight.bold, // Text weight
            ),
          ),
        ],
      ),
    );
  }
}
