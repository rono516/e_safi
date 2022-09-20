// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;
import 'package:wasteapp/models/channel.dart';
import 'package:wasteapp/sensordata/sensordata.dart';

class BinDataView extends StatefulWidget {
  const BinDataView({Key? key}) : super(key: key);

  static const routeName = '/bin_data_view';

  @override
  State<BinDataView> createState() => _BinDataViewState();
}

class _BinDataViewState extends State<BinDataView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Waste bin level Bin ID: 17273838'),
        backgroundColor: Colors.green[900],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[300],
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: SafeArea(
          child: LineChart(LineChartData(
              minX: 0,
              maxX: 2,
              minY: 0,
              maxY: 300,
              titlesData: FlTitlesData(
                bottomTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              gridData: FlGridData(
                  show: true,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(strokeWidth: 1, color: Colors.black);
                  },
                  drawVerticalLine: true,
                  getDrawingVerticalLine: (value) {
                    return FlLine(color: Colors.black, strokeWidth: 1);
                  }),
              borderData:
                  FlBorderData(show: true, border: Border.all(width: 1)),
              lineBarsData: [
                LineChartBarData(
                    spots: [
                      //FlSpot(0, 0),

                      FlSpot(0, 188),
                      FlSpot(1, 189),
                      FlSpot(2, 200),
                    ],
                    // isCurved: true,
                    barWidth: 3)
              ])),
        ),
      ),
    );

    // return Scaffold(
    //   backgroundColor: Colors.green[800],
    //   body: SafeArea(
    //     child: Column(children: [
    //       LineChart(LineChartData(
    //           minX: 0,
    //           maxX: 2,
    //           minY: 0,
    //           maxY: 400,
    //           lineBarsData: [
    //             LineChartBarData(
    //                 spots: [FlSpot(0, 300), FlSpot(1, 200), FlSpot(2, 300)])
    //           ])),
    //       // SizedBox(height: 25),

    //       //white area
    //       Expanded(
    //         child: Container(
    //           padding: EdgeInsets.all(25),
    //           color: Colors.grey[300],
    //           child: Center(
    //             child: Column(
    //               children: [
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   children: [
    //                     Text(
    //                       'Bin data view',
    //                       style: TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: 20,
    //                       ),
    //                     ),
    //                     // Icon(Icons.home, color: Colors.green),
    //                     IconButton(
    //                         onPressed: () {
    //                           Navigator.of(context).pop();
    //                         },
    //                         icon: Icon(Icons.home, color: Colors.green))
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     ]),
    //   ),
    // );
  }
}
