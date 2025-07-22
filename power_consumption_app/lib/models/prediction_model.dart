class PredictionModel {
  final double temperature;
  final double humidity;
  final double windSpeed;
  final double generalDiffuseFlows;
  final double diffuseFlows;
  final int hour;
  final int dayOfWeek;
  final int month;

  PredictionModel({
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.generalDiffuseFlows,
    required this.diffuseFlows,
    required this.hour,
    required this.dayOfWeek,
    required this.month,
  });

  Map<String, dynamic> toJson() {
    return {
      'temperature': temperature,
      'humidity': humidity,
      'wind_speed': windSpeed,
      'general_diffuse_flows': generalDiffuseFlows,
      'diffuse_flows': diffuseFlows,
      'hour': hour,
      'day_of_week': dayOfWeek,
      'month': month,
    };
  }
}