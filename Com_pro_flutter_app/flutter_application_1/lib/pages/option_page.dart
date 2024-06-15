import 'package:flutter/material.dart'; // Importing Flutter's material design package
import 'package:flutter_application_1/pages/home_page.dart'; // Importing the HomePage from your project
import 'package:http/http.dart'
    as http; // Importing HTTP package for API requests
import 'dart:convert'; // Importing JSON conversion utilities
import 'package:flutter/services.dart'
    show rootBundle; // Importing rootBundle for loading assets
import 'package:dropdown_search/dropdown_search.dart'; // Importing DropdownSearch for searchable dropdown

class OptionPage extends StatelessWidget {
  // Defining a stateless widget named OptionPage
  const OptionPage({super.key}); // Constructor for OptionPage, accepting a key

  @override
  Widget build(BuildContext context) {
    // Building the widget tree
    return const MaterialApp(
      // MaterialApp widget is the root of the application
      title: 'Used Car Price Prediction', // Title of the application
      home:
          CarPricePrediction(), // Setting CarPricePrediction as the home screen
    );
  }
}

class CarPricePrediction extends StatefulWidget {
  // Defining a stateful widget named CarPricePrediction
  const CarPricePrediction(
      {super.key}); // Constructor for CarPricePrediction, accepting a key

  @override
  _CarPricePredictionState createState() =>
      _CarPricePredictionState(); // Creating the state for CarPricePrediction
}

class _CarPricePredictionState extends State<CarPricePrediction> {
  final _formKey = GlobalKey<FormState>(); // Key for the form
  final TextEditingController _mileageController =
      TextEditingController(); // Controller for mileage input
  final TextEditingController _yearController =
      TextEditingController(); // Controller for year input
  final TextEditingController _ownersController =
      TextEditingController(); // Controller for previous owners input
  final TextEditingController _engineController =
      TextEditingController(); // Controller for engine size input
  final TextEditingController _doorsController =
      TextEditingController(); // Controller for number of doors input
  final TextEditingController _seatsController =
      TextEditingController(); // Controller for number of seats input

  Map<String, int> titleMap =
      {}; // Map to store car titles and their encoded values
  String _title = ''; // Variable to store selected car title

  final Map<String, int> fuelTypeMap = {
    // Map for fuel types and their encoded values
    'Petrol': 1,
    'Diesel': 2,
    'Electric': 3,
    'Hybrid': 4,
  };

  final Map<String, int> bodyTypeMap = {
    // Map for body types and their encoded values
    'Sedan': 1,
    'Hatchback': 2,
    'SUV': 3,
    'Convertible': 4,
  };

  final Map<String, int> gearboxMap = {
    // Map for gearbox types and their encoded values
    'Manual': 1,
    'Automatic': 2,
  };

  final Map<String, int> emissionClassMap = {
    // Map for emission classes and their encoded values
    'Euro 4': 1,
    'Euro 5': 2,
    'Euro 6': 3,
    'Other': 4,
  };

  // Initial selected values for dropdowns
  String _fuelType = 'Petrol';
  String _bodyType = 'Sedan';
  String _gearbox = 'Manual';
  String _emissionClass = 'Euro 4';
  String _predictedPrice = ''; // Variable to store the predicted price

  @override
  void initState() {
    super.initState();
    _loadTitleData(); // Load title data when the widget is initialized
  }

  Future<void> _loadTitleData() async {
    // Function to load car titles from a JSON file
    final String response = await rootBundle.loadString('assets/title.json');
    final data = await json.decode(response);
    setState(() {
      titleMap = Map<String, int>.from(data);
      _title = titleMap.keys.first; // Set default value for title dropdown
    });
  }

  Future<void> _predictPrice() async {
    // Function to send car details to the API and get the predicted price
    const url =
        'https://3685-80-195-49-69.ngrok-free.app/predict'; // Use the Ngrok URL provided
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'title': titleMap[_title], // Convert text to encoded value
          'Mileage(miles)': int.parse(_mileageController.text),
          'Registration_Year': int.parse(_yearController.text),
          'Previous Owners': int.parse(_ownersController.text),
          'Fuel type': fuelTypeMap[_fuelType], // Convert text to encoded value
          'Body type': bodyTypeMap[_bodyType], // Convert text to encoded value
          'Engine': double.parse(_engineController.text),
          'Gearbox': gearboxMap[_gearbox], // Convert text to encoded value
          'Doors': int.parse(_doorsController.text),
          'Seats': int.parse(_seatsController.text),
          'Emission Class':
              emissionClassMap[_emissionClass], // Convert text to encoded value
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _showDialog(_predictedPrice = data['predicted_price'].toString());
        });
      } else {
        setState(() {
          _showDialog(_predictedPrice = 'Error: Opps');
        });
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        _showDialog(_predictedPrice = 'Error: Opps');
      });
    }
  }

  void _showDialog(String predictedPrice) {
    // Function to display a dialog with the predicted price
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Predicted Price',
                style: TextStyle(
                    fontSize: 30, color: Color.fromARGB(255, 2, 0, 36)),
              ),
            ],
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                predictedPrice.isEmpty
                    ? 'Enter car details to get a prediction'
                    : "£" + '$predictedPrice',
                style: const TextStyle(fontSize: 40, color: Colors.green),
              ),
            ],
          ),
          actions: <Widget>[
            const Image(image: AssetImage('assets/car.png')), // Car image
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                        elevation: 2,
                        backgroundColor: const Color.fromARGB(255, 2, 0, 36)),
                    child: const Text(
                      'Edit',
                      style: TextStyle(color: Colors.white),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                        elevation: 2,
                        backgroundColor: const Color.fromARGB(255, 2, 0, 36)),
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ],
        );
      },
    );
  }

  void _clearFields() {
    // Function to clear all input fields and reset dropdowns
    _mileageController.clear();
    _yearController.clear();
    _ownersController.clear();
    _engineController.clear();
    _doorsController.clear();
    _seatsController.clear();
    setState(() {
      _title = titleMap.keys.first;
      _fuelType = 'Petrol';
      _bodyType = 'Sedan';
      _gearbox = 'Manual';
      _emissionClass = 'Euro 4';
      _predictedPrice = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    // Building the widget tree
    return Scaffold(
      appBar: AppBar(
        // AppBar widget at the top of the screen
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person_2)) // Profile icon button
        ],
        title: const Text('Used Car Price Prediction'), // Title of the AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Back arrow icon
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const HomePage()), // Navigating to the HomePage
            );
          },
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding around the form
          child: Form(
            key: _formKey, // Assigning the form key
            child: ListView(
              children: [
                if (titleMap.isNotEmpty) // Ensure the title map is loaded
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: DropdownSearch<String>(
                      items: titleMap.keys.toList(), // Items for the dropdown
                      selectedItem: _title, // Selected item in the dropdown
                      dropdownDecoratorProps: const DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: 'Title', // Label for the dropdown
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 2, 0, 36),
                            fontSize: 25,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          // Added the following line to change input text color to black
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  Colors.black, // Set the border color to black
                            ),
                          ),
                        ),
                        baseStyle: TextStyle(
                          color:
                              Colors.black, // Set the input text color to black
                        ),
                      ),
                      popupProps: PopupProps.dialog(
                        title: const Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Search here", // Title for the search dialog
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        showSearchBox:
                            true, // Enable search box in the dropdown
                        fit: FlexFit.loose,
                        containerBuilder: (ctx, popupWidget) {
                          return Material(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Colors.white,
                            child: popupWidget,
                          );
                        },
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          _title = newValue!;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select title';
                        }
                        return null;
                      },
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: _mileageController,
                    decoration: const InputDecoration(
                      labelText: 'Mileage (miles)', // Label for mileage input
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 2, 0, 36), fontSize: 25),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter mileage';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: _yearController,
                    decoration: const InputDecoration(
                      hintText:
                          "between 1900 and 2024", // Hint text for year input
                      hintStyle: TextStyle(color: Colors.black, fontSize: 15),
                      labelText: 'Registration Year', // Label for year input
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 2, 0, 36), fontSize: 25),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter registration year';
                      }
                      int year;
                      try {
                        year = int.parse(value);
                      } catch (e) {
                        return 'Please enter a valid year';
                      }
                      if (year < 1900 || year > 2024) {
                        return 'Year must be between 1900 and 2024';
                      }
                      if (value.length != 4) {
                        return 'Year must be a four-digit number';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: _ownersController,
                    decoration: const InputDecoration(
                      labelText:
                          'Previous Owners', // Label for previous owners input
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 2, 0, 36), fontSize: 25),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter number of previous owners';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: DropdownButtonFormField<String>(
                    style: const TextStyle(color: Colors.black),
                    value: _fuelType,
                    decoration: const InputDecoration(
                      labelText: 'Fuel Type', // Label for fuel type dropdown
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 2, 0, 36), fontSize: 25),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    items: fuelTypeMap.keys.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _fuelType = newValue!;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select fuel type';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: DropdownButtonFormField<String>(
                    style: const TextStyle(color: Colors.black),
                    value: _bodyType,
                    decoration: const InputDecoration(
                      labelText: 'Body Type', // Label for body type dropdown
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 2, 0, 36), fontSize: 25),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    items: bodyTypeMap.keys.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _bodyType = newValue!;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select body type';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: _engineController,
                    decoration: const InputDecoration(
                      labelText: 'Engine (Liters)', // Label for engine input
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 2, 0, 36), fontSize: 25),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter engine size';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: DropdownButtonFormField<String>(
                    style: const TextStyle(color: Colors.black),
                    value: _gearbox,
                    decoration: const InputDecoration(
                      labelText: 'Gearbox', // Label for gearbox dropdown
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 2, 0, 36), fontSize: 25),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    items: gearboxMap.keys.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _gearbox = newValue!;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select gearbox type';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: _doorsController,
                    decoration: const InputDecoration(
                      labelText: 'Doors', // Label for doors input
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 2, 0, 36), fontSize: 25),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter number of doors';
                      }
                      int doors;
                      try {
                        doors = int.parse(value);
                      } catch (e) {
                        return 'Please enter a valid number';
                      }
                      if (doors < 2 || doors > 5) {
                        return 'Door number must be between 2 to 5';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: _seatsController,
                    decoration: const InputDecoration(
                      labelText: 'Seats', // Label for seats input
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 2, 0, 36), fontSize: 25),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter number of seats';
                      }
                      int seats;
                      try {
                        seats = int.parse(value);
                      } catch (e) {
                        return 'Please enter a valid number';
                      }
                      if (seats < 2 || seats > 7) {
                        return 'Seat number must be between 2 to 7';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: DropdownButtonFormField<String>(
                    style: const TextStyle(color: Colors.black),
                    value: _emissionClass,
                    decoration: const InputDecoration(
                      labelText:
                          'Emission Class', // Label for emission class dropdown
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 2, 0, 36), fontSize: 25),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    items: emissionClassMap.keys.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _emissionClass = newValue!;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select emission class';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20), // Spacing between elements
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 2, 0, 36)),
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            _predictPrice(); // Call predict price function if form is valid
                          }
                        },
                        child: const Text(
                          'Predict', // Predict button text
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 2, 0, 36),
                        ),
                        onPressed: _clearFields, // Call clear fields function
                        child: const Text(
                          'Clear', // Clear button text
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}






//=========================================================================================================






// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/home_page.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:dropdown_search/dropdown_search.dart'; // Added for searchable dropdown

// class OptionPage extends StatelessWidget {
//   const OptionPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Used Car Price Prediction',
//       home: CarPricePrediction(),
//     );
//   }
// }

// class CarPricePrediction extends StatefulWidget {
//   const CarPricePrediction({super.key});

//   @override
//   _CarPricePredictionState createState() => _CarPricePredictionState();
// }

// class _CarPricePredictionState extends State<CarPricePrediction> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _mileageController = TextEditingController();
//   final TextEditingController _yearController = TextEditingController();
//   final TextEditingController _ownersController = TextEditingController();
//   final TextEditingController _engineController = TextEditingController();
//   final TextEditingController _doorsController = TextEditingController();
//   final TextEditingController _seatsController = TextEditingController();

//   Map<String, int> titleMap = {}; // Modified: Declare titleMap
//   String _title = ''; // Modified: Add _title variable for the dropdown

//   final Map<String, int> fuelTypeMap = {
//     'Petrol': 1,
//     'Diesel': 2,
//     'Electric': 3,
//     'Hybrid': 4,
//   };

//   final Map<String, int> bodyTypeMap = {
//     'Sedan': 1,
//     'Hatchback': 2,
//     'SUV': 3,
//     'Convertible': 4,
//   };

//   final Map<String, int> gearboxMap = {
//     'Manual': 1,
//     'Automatic': 2,
//   };

//   final Map<String, int> emissionClassMap = {
//     'Euro 4': 1,
//     'Euro 5': 2,
//     'Euro 6': 3,
//     'Other': 4,
//   };

//   // Initial selected values
//   String _fuelType = 'Petrol';
//   String _bodyType = 'Sedan';
//   String _gearbox = 'Manual';
//   String _emissionClass = 'Euro 4';
//   String _predictedPrice = '';

//   @override
//   void initState() {
//     super.initState();
//     _loadTitleData(); // Load title data when the widget is initialized
//   }

//   Future<void> _loadTitleData() async {
//     final String response = await rootBundle.loadString('assets/title.json');
//     final data = await json.decode(response);
//     setState(() {
//       titleMap = Map<String, int>.from(data);
//       _title = titleMap.keys.first; // Set default value for title dropdown
//     });
//   }

//   Future<void> _predictPrice() async {
//     const url =
//         'https://3685-80-195-49-69.ngrok-free.app/predict'; // Use the Ngrok URL provided
//     try {
//       final response = await http.post(
//         Uri.parse(url),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           'title': titleMap[_title], // Convert text to encoded value
//           'Mileage(miles)': int.parse(_mileageController.text),
//           'Registration_Year': int.parse(_yearController.text),
//           'Previous Owners': int.parse(_ownersController.text),
//           'Fuel type': fuelTypeMap[_fuelType], // Convert text to encoded value
//           'Body type': bodyTypeMap[_bodyType], // Convert text to encoded value
//           'Engine': double.parse(_engineController.text),
//           'Gearbox': gearboxMap[_gearbox], // Convert text to encoded value
//           'Doors': int.parse(_doorsController.text),
//           'Seats': int.parse(_seatsController.text),
//           'Emission Class':
//               emissionClassMap[_emissionClass], // Convert text to encoded value
//         }),
//       );

//       print('Response status: ${response.statusCode}');
//       print('Response body: ${response.body}');

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         setState(() {
//           _showDialog(_predictedPrice = data['predicted_price'].toString());
//         });
//       } else {
//         setState(() {
//           _showDialog(_predictedPrice = 'Error: Opps');
//         });
//       }
//     } catch (e) {
//       print('Error: $e');
//       setState(() {
//         _showDialog(_predictedPrice = 'Error: Opps');
//       });
//     }
//   }

//   void _showDialog(String predictedPrice) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Predicted Price',
//                 style: TextStyle(
//                     fontSize: 30, color: Color.fromARGB(255, 2, 0, 36)),
//               ),
//             ],
//           ),
//           content: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 predictedPrice.isEmpty
//                     ? 'Enter car details to get a prediction'
//                     : "£" + '$predictedPrice',
//                 style: const TextStyle(fontSize: 40, color: Colors.green),
//               ),
//             ],
//           ),
//           actions: <Widget>[
//             const Image(image: AssetImage('assets/car.png')),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     style: TextButton.styleFrom(
//                         elevation: 2,
//                         backgroundColor: const Color.fromARGB(255, 2, 0, 36)),
//                     child: const Text(
//                       'Edit',
//                       style: TextStyle(color: Colors.white),
//                     )),
//                 TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     style: TextButton.styleFrom(
//                         elevation: 2,
//                         backgroundColor: const Color.fromARGB(255, 2, 0, 36)),
//                     child: const Text(
//                       'Save',
//                       style: TextStyle(color: Colors.white),
//                     )),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _clearFields() {
//     _mileageController.clear();
//     _yearController.clear();
//     _ownersController.clear();
//     _engineController.clear();
//     _doorsController.clear();
//     _seatsController.clear();
//     setState(() {
//       _title = titleMap.keys.first;
//       _fuelType = 'Petrol';
//       _bodyType = 'Sedan';
//       _gearbox = 'Manual';
//       _emissionClass = 'Euro 4';
//       _predictedPrice = '';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(onPressed: () {}, icon: const Icon(Icons.person_2))
//         ],
//         title: const Text('Used Car Price Prediction'),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const HomePage()),
//             );
//           },
//         ),
//       ),
//       body: Container(
//         // // decoration: const BoxDecoration(
//         // //   image: DecorationImage(
//         // //     image: AssetImage("assets/price_predictionn_bc.png"),
//         // //     fit: BoxFit.cover,
//         // //   ),
//         // ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: ListView(
//               children: [
//                 if (titleMap.isNotEmpty) // Ensure the title map is loaded
//                   Padding(
//                     padding: const EdgeInsets.only(top: 15),
//                     child: DropdownSearch<String>(
//                       items: titleMap.keys.toList(),
//                       selectedItem: _title,
//                       dropdownDecoratorProps: const DropDownDecoratorProps(
//                         dropdownSearchDecoration: InputDecoration(
//                           labelText: 'Title',
//                           labelStyle: TextStyle(
//                             color: Color.fromARGB(255, 2, 0, 36),
//                             fontSize: 25,
//                           ),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(10),
//                             ),
//                           ),
//                           // Added the following line to change input text color to black
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color:
//                                   Colors.black, // Set the border color to black
//                             ),
//                           ),
//                         ),
//                         baseStyle: TextStyle(
//                           color:
//                               Colors.black, // Set the input text color to black
//                         ),
//                       ),
//                       popupProps: PopupProps.dialog(
//                         title: const Padding(
//                           padding: EdgeInsets.all(5),
//                           child: Text(
//                             "Search here",
//                             style: TextStyle(fontSize: 20),
//                           ),
//                         ),
//                         showSearchBox: true,
//                         fit: FlexFit.loose,
//                         containerBuilder: (ctx, popupWidget) {
//                           return Material(
//                             borderRadius: const BorderRadius.all(
//                               Radius.circular(10),
//                             ),
//                             color: Colors.white,
//                             child: popupWidget,
//                           );
//                         },
//                       ),
//                       onChanged: (newValue) {
//                         setState(() {
//                           _title = newValue!;
//                         });
//                       },
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please select title';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 15),
//                   child: TextFormField(
//                     style: const TextStyle(color: Colors.black),
//                     controller: _mileageController,
//                     decoration: const InputDecoration(
//                       labelText: 'Mileage (miles)',
//                       labelStyle: TextStyle(
//                           color: Color.fromARGB(255, 2, 0, 36), fontSize: 25),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(10),
//                         ),
//                       ),
//                     ),
//                     keyboardType: TextInputType.number,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter mileage';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 15),
//                   child: TextFormField(
//                     style: const TextStyle(color: Colors.black),
//                     controller: _yearController,
//                     decoration: const InputDecoration(
//                       hintText: "between 1900 and 2024",
//                       hintStyle: TextStyle(color: Colors.black, fontSize: 15),
//                       labelText: 'Registration Year',
//                       labelStyle: TextStyle(
//                           color: Color.fromARGB(255, 2, 0, 36), fontSize: 25),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(10),
//                         ),
//                       ),
//                     ),
//                     keyboardType: TextInputType.number,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter registration year';
//                       }
//                       int year;
//                       try {
//                         year = int.parse(value);
//                       } catch (e) {
//                         return 'Please enter a valid year';
//                       }
//                       if (year < 1900 || year > 2024) {
//                         return 'Year must be between 1900 and 2024';
//                       }
//                       if (value.length != 4) {
//                         return 'Year must be a four-digit number';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 15),
//                   child: TextFormField(
//                     style: const TextStyle(color: Colors.black),
//                     controller: _ownersController,
//                     decoration: const InputDecoration(
//                       labelText: 'Previous Owners',
//                       labelStyle: TextStyle(
//                           color: Color.fromARGB(255, 2, 0, 36), fontSize: 25),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(10),
//                         ),
//                       ),
//                     ),
//                     keyboardType: TextInputType.number,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter number of previous owners';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 15),
//                   child: DropdownButtonFormField<String>(
//                     style: const TextStyle(color: Colors.black),
//                     value: _fuelType,
//                     decoration: const InputDecoration(
//                       labelText: 'Fuel Type',
//                       labelStyle: TextStyle(
//                           color: Color.fromARGB(255, 2, 0, 36), fontSize: 25),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(10),
//                         ),
//                       ),
//                     ),
//                     items: fuelTypeMap.keys.map((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                     onChanged: (newValue) {
//                       setState(() {
//                         _fuelType = newValue!;
//                       });
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please select fuel type';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 15),
//                   child: DropdownButtonFormField<String>(
//                     style: const TextStyle(color: Colors.black),
//                     value: _bodyType,
//                     decoration: const InputDecoration(
//                       labelText: 'Body Type',
//                       labelStyle: TextStyle(
//                           color: Color.fromARGB(255, 2, 0, 36), fontSize: 25),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(10),
//                         ),
//                       ),
//                     ),
//                     items: bodyTypeMap.keys.map((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                     onChanged: (newValue) {
//                       setState(() {
//                         _bodyType = newValue!;
//                       });
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please select body type';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 15),
//                   child: TextFormField(
//                     style: const TextStyle(color: Colors.black),
//                     controller: _engineController,
//                     decoration: const InputDecoration(
//                       labelText: 'Engine (Liters)',
//                       labelStyle: TextStyle(
//                           color: Color.fromARGB(255, 2, 0, 36), fontSize: 25),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(10),
//                         ),
//                       ),
//                     ),
//                     keyboardType: TextInputType.number,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter engine size';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 15),
//                   child: DropdownButtonFormField<String>(
//                     style: const TextStyle(color: Colors.black),
//                     value: _gearbox,
//                     decoration: const InputDecoration(
//                       labelText: 'Gearbox',
//                       labelStyle: TextStyle(
//                           color: Color.fromARGB(255, 2, 0, 36), fontSize: 25),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(10),
//                         ),
//                       ),
//                     ),
//                     items: gearboxMap.keys.map((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                     onChanged: (newValue) {
//                       setState(() {
//                         _gearbox = newValue!;
//                       });
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please select gearbox type';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 15),
//                   child: TextFormField(
//                     style: const TextStyle(color: Colors.black),
//                     controller: _doorsController,
//                     decoration: const InputDecoration(
//                       labelText: 'Doors',
//                       labelStyle: TextStyle(
//                           color: Color.fromARGB(255, 2, 0, 36), fontSize: 25),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(10),
//                         ),
//                       ),
//                     ),
//                     keyboardType: TextInputType.number,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter number of doors';
//                       }
//                       int doors;
//                       try {
//                         doors = int.parse(value);
//                       } catch (e) {
//                         return 'Please enter a valid year';
//                       }
//                       if (doors < 2 || doors > 5) {
//                         return 'Door number must be between 2 to 5';
//                       }
//                       if (value.length != 1) {
//                         return 'Door number must be between 2 to 5';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 15),
//                   child: TextFormField(
//                     style: const TextStyle(color: Colors.black),
//                     controller: _seatsController,
//                     decoration: const InputDecoration(
//                       labelText: 'Seats',
//                       labelStyle: TextStyle(
//                           color: Color.fromARGB(255, 2, 0, 36), fontSize: 25),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(10),
//                         ),
//                       ),
//                     ),
//                     keyboardType: TextInputType.number,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter number of seats';
//                       }
//                       int seats;
//                       try {
//                         seats = int.parse(value);
//                       } catch (e) {
//                         return 'Please enter a valid year';
//                       }
//                       if (seats < 2 || seats > 7) {
//                         return 'Seat number must be between 2 to 7';
//                       }
//                       if (value.length != 1) {
//                         return 'Seat number must be between 2 to 7';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 15),
//                   child: DropdownButtonFormField<String>(
//                     style: const TextStyle(color: Colors.black),
//                     value: _emissionClass,
//                     decoration: const InputDecoration(
//                       labelText: 'Emission Class',
//                       labelStyle: TextStyle(
//                           color: Color.fromARGB(255, 2, 0, 36), fontSize: 25),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(10),
//                         ),
//                       ),
//                     ),
//                     items: emissionClassMap.keys.map((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                     onChanged: (newValue) {
//                       setState(() {
//                         _emissionClass = newValue!;
//                       });
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please select emission class';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor:
//                                 const Color.fromARGB(255, 2, 0, 36)),
//                         onPressed: () {
//                           if (_formKey.currentState?.validate() ?? false) {
//                             _predictPrice();
//                           }
//                         },
//                         child: const Text(
//                           'Predict',
//                           style: TextStyle(color: Colors.white, fontSize: 20),
//                         )),
//                     ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color.fromARGB(255, 2, 0, 36),
//                         ),
//                         onPressed: _clearFields,
//                         child: const Text(
//                           'Clear',
//                           style: TextStyle(color: Colors.white, fontSize: 20),
//                         )),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
