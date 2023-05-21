import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomChart extends StatelessWidget {
  const CustomChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,

      width: MediaQuery.of(context).size.width * 2/3
      ,
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
              Sales('2월', 25),
              Sales('3월', 38),
              Sales('4월', 34),

            ],
            xValueMapper: (Sales sales, _) => sales.year,
            yValueMapper: (Sales sales, _) => sales.sales,
            dataLabelSettings: DataLabelSettings(isVisible: false), // Hide data label
            borderRadius: BorderRadius.all(Radius.circular(15)), // Round corners
            width: 0.4, // Adjust bar width
            spacing: 0.2, // Add spacing between bars
          ),
          ColumnSeries<Sales, String>(
            name: 'Sales 2',
            color: Colors.red,
            dataSource: [
              Sales('2월', 35),
              Sales('3월', 28),
              Sales('4월', 44),

            ],
            xValueMapper: (Sales sales, _) => sales.year,
            yValueMapper: (Sales sales, _) => sales.sales,
            dataLabelSettings: DataLabelSettings(isVisible: false), // Hide data label
            borderRadius: BorderRadius.all(Radius.circular(15)), // Round corners
            width: 0.4, // Adjust bar width
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