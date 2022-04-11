import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SalesData {
  final int year;
  final int sales;

  SalesData(this.year, this.sales);
}

class ActivityWidget extends StatelessWidget {
  ActivityWidget({Key? key, required this.name}) : super(key: key);

  final String name;
  final recent = ['10 / 04 - 2022', '05 / 04 - 2022', '01 / 04 - 2022'];
  final recentStat = ['30 min', '15 min', '45 min'];
  final goal = ['5:00 min/km', '3 times/week'];
  final goalStat = ['5:09 min/km', '1 time'];

  final data = [
    SalesData(0, 30),
    SalesData(1, 75),
    SalesData(2, 60),
    SalesData(3, 10),
    SalesData(4, 90),
    SalesData(5, 30),
    SalesData(6, 0),
    SalesData(7, 40),
    SalesData(8, 54),
    SalesData(9, 89),
    SalesData(10, 20),
    SalesData(11, 45),
    SalesData(12, 98),
    SalesData(13, 45),
    SalesData(14, 44),
    SalesData(15, 39),
    SalesData(16, 51),
    SalesData(17, 89),
    SalesData(18, 59),
    SalesData(19, 67),
  ];

  _getSeriesData() {
    List<charts.Series<SalesData, int>> series = [
      charts.Series(
          id: "Sales",
          data: data,
          domainFn: (SalesData series, _) => series.year,
          measureFn: (SalesData series, _) => series.sales,
          colorFn: (SalesData series, _) =>
              charts.MaterialPalette.blue.shadeDefault)
    ];
    return series;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 212, 212, 212),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  name,
                  textAlign: TextAlign.start,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 100,
                      width: 200,
                      child: charts.LineChart(
                        _getSeriesData(),
                        animate: true,
                      ),
                    ),
                    Column(
                      children: [
                        const Text('Recent'),
                        if (recent.isNotEmpty)
                          for (var i = 0; i < 3 && i < recent.length; i++)
                            Text(recent[i] + '\n' + recentStat[i])
                        else
                          const Text('No recent acctivity'),
                      ],
                    ),
                  ],
                ),
                const Divider(
                  height: 2,
                  color: Colors.black,
                  indent: 10,
                  endIndent: 10,
                ),
                Column(
                  children: [
                    const Text('Goals'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (recent.isNotEmpty)
                          for (var i = 0; i < 3 && i < goal.length; i++)
                            Text(goal[i] + '\n' + goalStat[i])
                        else
                          const Text('No goals currently')
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text('more'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
