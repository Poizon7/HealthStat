import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:health_stat/training_data.dart';

final List<TrainingData> data = [
  TrainingData(day: 'Monday', hoursTrained: 1),
  TrainingData(day: 'Tuesday', hoursTrained: 2),
  TrainingData(day: 'Wednesday', hoursTrained: 4),
  TrainingData(day: 'Thursday', hoursTrained: 1),
  TrainingData(day: 'Friday', hoursTrained: 2),
  TrainingData(day: 'Saturday', hoursTrained: 3),
  TrainingData(day: 'Sunday', hoursTrained: 2),
];

_getSeriesData() {
  List<charts.Series<TrainingData, String>> series = [
    charts.Series(
        id: "HoursTrained",
        data: data,
        domainFn: (TrainingData series, _) => series.day,
        measureFn: (TrainingData series, _) => series.hoursTrained)
  ];
  return series;
}

@override
Widget hoursTrained(BuildContext context) {
  return Center(
    child: Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "Hours trained this week",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: charts.BarChart(
                  _getSeriesData(),
                  animate: true,
                  domainAxis: charts.OrdinalAxisSpec(
                      renderSpec:
                          charts.SmallTickRendererSpec(labelRotation: 60)),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
