import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:power_consumption_app/providers/prediction_provider.dart';
import 'package:power_consumption_app/widgets/primary_button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PredictionProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Prediction Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (provider.isLoading)
              const Center(child: CircularProgressIndicator())
            else if (provider.error != null)
              _buildError(provider.error!)
            else if (provider.prediction != null)
              _buildSuccess(provider.prediction!)
            else
              const Text('No prediction data available'),
            const SizedBox(height: 32),
            PrimaryButton(
              onPressed: () {
                provider.reset();
                Navigator.pop(context);
              },
              text: 'Make Another Prediction',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccess(double prediction) {
    return Column(
      children: [
        const Icon(
          Icons.check_circle_outline,
          color: Colors.green,
          size: 80,
        ),
        const SizedBox(height: 24),
        const Text(
          'Predicted Power Consumption:',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          '${prediction.toStringAsFixed(2)} kWh',
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildError(String error) {
    return Column(
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 80,
        ),
        const SizedBox(height: 24),
        const Text(
          'Error making prediction:',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          error,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.red,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}