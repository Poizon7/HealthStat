import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class TrainingData {
  late String day;
  late int hoursTrained;

  TrainingData({
    required this.day,
    required this.hoursTrained,
  });
}
