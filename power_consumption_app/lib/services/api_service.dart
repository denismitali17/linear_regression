import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/prediction_model.dart';

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:8002'; 

  Future<double> predictConsumption(PredictionModel prediction) async {
    final url = Uri.parse('$baseUrl/predict');
    
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(prediction.toJson()),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['predicted_consumption'].toDouble();
      } else {
        throw Exception('Failed to get prediction: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}