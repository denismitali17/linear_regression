import 'package:flutter/material.dart';
import '../models/prediction_model.dart';
import '../services/api_service.dart';

class PredictionProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  String? _error;
  double? _prediction;

  bool get isLoading => _isLoading;
  String? get error => _error;
  double? get prediction => _prediction;

  Future<void> predict(PredictionModel prediction) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _prediction = await _apiService.predictConsumption(prediction);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void reset() {
    _prediction = null;
    _error = null;
    notifyListeners();
  }
}