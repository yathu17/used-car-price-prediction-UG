import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OptionPage extends StatelessWidget {
  const OptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Used Car Price Prediction',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CarPricePrediction(),
    );
  }
}

class CarPricePrediction extends StatefulWidget {
  const CarPricePrediction({super.key});

  @override
  _CarPricePredictionState createState() => _CarPricePredictionState();
}

class _CarPricePredictionState extends State<CarPricePrediction> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _mileageController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _ownersController = TextEditingController();
  final TextEditingController _fuelTypeController = TextEditingController();
  final TextEditingController _bodyTypeController = TextEditingController();
  final TextEditingController _engineController = TextEditingController();
  final TextEditingController _gearboxController = TextEditingController();
  final TextEditingController _doorsController = TextEditingController();
  final TextEditingController _seatsController = TextEditingController();
  final TextEditingController _emissionClassController =
      TextEditingController();

  String _predictedPrice = '';

  Future<void> _predictPrice() async {
    const url =
        'https://b90d-80-195-49-69.ngrok-free.app/predict'; // Use the Ngrok URL provided
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'Mileage(miles)': int.parse(_mileageController.text),
          'Registration_Year': int.parse(_yearController.text),
          'Previous Owners': int.parse(_ownersController.text),
          'Fuel type': int.parse(_fuelTypeController.text),
          'Body type': int.parse(_bodyTypeController.text),
          'Engine': double.parse(_engineController.text),
          'Gearbox': int.parse(_gearboxController.text),
          'Doors': int.parse(_doorsController.text),
          'Seats': int.parse(_seatsController.text),
          'Emission Class': int.parse(_emissionClassController.text),
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _predictedPrice = data['predicted_price'].toString();
        });
      } else {
        setState(() {
          _predictedPrice = 'Error: Could not predict price';
        });
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        _predictedPrice = 'Error: Could not predict price';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Used Car Price Prediction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _mileageController,
                decoration: const InputDecoration(labelText: 'Mileage (miles)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter mileage';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _yearController,
                decoration:
                    const InputDecoration(labelText: 'Registration Year'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter registration year';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ownersController,
                decoration: const InputDecoration(labelText: 'Previous Owners'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter number of previous owners';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _fuelTypeController,
                decoration:
                    const InputDecoration(labelText: 'Fuel Type (Encoded)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter fuel type';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _bodyTypeController,
                decoration:
                    const InputDecoration(labelText: 'Body Type (Encoded)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter body type';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _engineController,
                decoration: const InputDecoration(labelText: 'Engine (Liters)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter engine size';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _gearboxController,
                decoration:
                    const InputDecoration(labelText: 'Gearbox (Encoded)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter gearbox type';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _doorsController,
                decoration: const InputDecoration(labelText: 'Doors'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter number of doors';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _seatsController,
                decoration: const InputDecoration(labelText: 'Seats'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter number of seats';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emissionClassController,
                decoration: const InputDecoration(
                    labelText: 'Emission Class (Encoded)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter emission class';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _predictPrice();
                  }
                },
                child: const Text('Predict Price'),
              ),
              const SizedBox(height: 20),
              Text(
                _predictedPrice.isEmpty
                    ? 'Enter car details to get a prediction'
                    : 'Predicted Price: $_predictedPrice',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
