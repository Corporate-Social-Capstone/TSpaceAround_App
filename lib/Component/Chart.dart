import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomChart extends StatelessWidget {
  final int ex1;
  final int ex2;
  final int ex3;
  final int ex4;
  final int ex5;
  final int ex6;

  const CustomChart(
      {required this.ex1,
      required this.ex2,
      required this.ex3,
      required this.ex4,
      required this.ex5,
      required this.ex6,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width * 2 / 3,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0, // Remove chart border
        primaryXAxis: CategoryAxis(
          majorGridLines: MajorGridLines(width: 0),
          axisLine: AxisLine(width: 0), // Hide axis line// Hide grid lines
        ),
        primaryYAxis: NumericAxis(
          isVisible: false, // Hide Y axis
        ),
        series: <ColumnSeries<Sales, String>>[
          ColumnSeries<Sales, String>(
            name: 'Sales 1',
            color: Colors.blue,
            dataSource: [
              Sales('3월', ex1.toDouble()),
              Sales('4월', ex3.toDouble()),
              Sales('5월', ex5.toDouble()),
            ],
            xValueMapper: (Sales sales, _) => sales.year,
            yValueMapper: (Sales sales, _) => sales.sales,
            dataLabelSettings: DataLabelSettings(isVisible: false),
            // Hide data label
            borderRadius: BorderRadius.all(Radius.circular(15)),
            // Round corners
            width: 0.4,
            // Adjust bar width
            spacing: 0.2, // Add spacing between bars
          ),
          ColumnSeries<Sales, String>(
            name: 'Sales 2',
            color: Colors.red,
            dataSource: [
              Sales('3월', ex2.toDouble()),
              Sales('4월', ex4.toDouble()),
              Sales('5월', ex6.toDouble()),
            ],
            xValueMapper: (Sales sales, _) => sales.year,
            yValueMapper: (Sales sales, _) => sales.sales,
            dataLabelSettings: DataLabelSettings(isVisible: false),
            // Hide data label
            borderRadius: BorderRadius.all(Radius.circular(15)),
            // Round corners
            width: 0.4,
            // Adjust bar width
            spacing: 0.2, // Add spacing between bars
          ),
        ],
      ),
    );
  }
}

class Sales {
  Sales(this.year, this.sales);

  final String year;
  final double sales;
}
