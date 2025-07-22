import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:power_consumption_app/models/prediction_model.dart';
import 'package:power_consumption_app/providers/prediction_provider.dart';
import 'package:power_consumption_app/providers/theme_provider.dart';
import 'package:power_consumption_app/screens/result_screen.dart';
import 'package:power_consumption_app/widgets/custom_text_field.dart';
import 'package:power_consumption_app/widgets/primary_button.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final _formKey = GlobalKey<FormState>();
  final _temperatureController = TextEditingController();
  final _humidityController = TextEditingController();
  final _windSpeedController = TextEditingController();
  final _generalDiffuseFlowsController = TextEditingController();
  final _diffuseFlowsController = TextEditingController();
  final _hourController = TextEditingController();
  final _dayOfWeekController = TextEditingController();
  final _monthController = TextEditingController();

  @override
  void dispose() {
    _temperatureController.dispose();
    _humidityController.dispose();
    _windSpeedController.dispose();
    _generalDiffuseFlowsController.dispose();
    _diffuseFlowsController.dispose();
    _hourController.dispose();
    _dayOfWeekController.dispose();
    _monthController.dispose();
    super.dispose();
  }

  void _clearForm() {
    _formKey.currentState?.reset();
    _temperatureController.clear();
    _humidityController.clear();
    _windSpeedController.clear();
    _generalDiffuseFlowsController.clear();
    _diffuseFlowsController.clear();
    _hourController.clear();
    _dayOfWeekController.clear();
    _monthController.clear();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final prediction = PredictionModel(
        temperature: double.parse(_temperatureController.text),
        humidity: double.parse(_humidityController.text),
        windSpeed: double.parse(_windSpeedController.text),
        generalDiffuseFlows: double.parse(_generalDiffuseFlowsController.text),
        diffuseFlows: double.parse(_diffuseFlowsController.text),
        hour: int.parse(_hourController.text),
        dayOfWeek: int.parse(_dayOfWeekController.text),
        month: int.parse(_monthController.text),
      );

      context.read<PredictionProvider>().predict(prediction).then((_) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ResultScreen(),
          ),
        ).then((_) => _clearForm());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Prediction Data'),
        actions: [
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, _) {
              return IconButton(
                icon: Icon(
                  themeProvider.themeMode == ThemeMode.dark
                      ? Icons.light_mode
                      : Icons.dark_mode,
                ),
                onPressed: () {
                  themeProvider.toggleTheme(
                      themeProvider.themeMode != ThemeMode.dark);
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                controller: _temperatureController,
                label: 'Temperature (°C)',
                hint: 'e.g., 25.5',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter temperature';
                  }
                  final temp = double.tryParse(value);
                  if (temp == null || temp < -20 || temp > 50) {
                    return 'Must be between -20 and 50';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _humidityController,
                label: 'Humidity (%)',
                hint: 'e.g., 60.0',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter humidity';
                  }
                  final humidity = double.tryParse(value);
                  if (humidity == null || humidity < 0 || humidity > 100) {
                    return 'Must be between 0 and 100';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _windSpeedController,
                label: 'Wind Speed (km/h)',
                hint: 'e.g., 10.0',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter wind speed';
                  }
                  final windSpeed = double.tryParse(value);
                  if (windSpeed == null || windSpeed < 0 || windSpeed > 100) {
                    return 'Must be between 0 and 100';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _generalDiffuseFlowsController,
                label: 'General Diffuse Flows',
                hint: 'e.g., 0.5',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter value';
                  }
                  final val = double.tryParse(value);
                  if (val == null || val < 0 || val > 1) {
                    return 'Must be between 0 and 1';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _diffuseFlowsController,
                label: 'Diffuse Flows',
                hint: 'e.g., 0.3',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter value';
                  }
                  final val = double.tryParse(value);
                  if (val == null || val < 0 || val > 1) {
                    return 'Must be between 0 and 1';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _hourController,
                label: 'Hour (0-23)',
                hint: 'e.g., 14',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter hour';
                  }
                  final hour = int.tryParse(value);
                  if (hour == null || hour < 0 || hour > 23) {
                    return 'Must be between 0 and 23';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _dayOfWeekController,
                label: 'Day of Week (0-6)',
                hint: '0=Monday, 6=Sunday',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter day of week';
                  }
                  final day = int.tryParse(value);
                  if (day == null || day < 0 || day > 6) {
                    return 'Must be between 0 and 6';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _monthController,
                label: 'Month (1-12)',
                hint: 'e.g., 7 for July',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter month';
                  }
                  final month = int.tryParse(value);
                  if (month == null || month < 1 || month > 12) {
                    return 'Must be between 1 and 12';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 32),
              PrimaryButton(
                onPressed: _submitForm,
                text: 'Predict',
              ),
            ],
          ),
        ),
      ),
    );
  }
}