import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:power_consumption_app/providers/theme_provider.dart';
import 'package:power_consumption_app/screens/input_screen.dart';
import 'package:power_consumption_app/widgets/primary_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Power Consumption Predictor'),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Icon(
                Icons.bolt,
                size: 100,
                color: Colors.blue,
              ),
              const SizedBox(height: 24),
              Text(
                'Power Consumption Predictor',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Predict power consumption based on environmental factors and time-based features',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const Spacer(),
              PrimaryButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InputScreen(),
                    ),
                  );
                },
                text: 'Get Started',
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}