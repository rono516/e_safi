// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;
import 'package:wasteapp/models/channel.dart';

class BinDataView extends StatefulWidget {
  const BinDataView({Key? key}) : super(key: key);

  static const routeName = '/bin_data_view';

  @override
  State<BinDataView> createState() => _BinDataViewState();
}

class _BinDataViewState extends State<BinDataView> {
  // getSensorData() async {
  // var url =
  //     "https://api.thingspeak.com/channels/1861455/feeds.json?api_key=CACC19YOE9ZU2AOQ&results=2";
  var response = http.get(Uri.parse(
      "https://api.thingspeak.com/channels/1861455/feeds.json?api_key=CACC19YOE9ZU2AOQ&results=2"));

  // if (response.statusCode == 200) {
  // Channel channelData = channelFromMap(response.body);

  // List<Feed> feedData = channelData.feeds;

  // return feedData[1].field1;
  //   return feedData;
  // } else {
  //   throw Exception("failed to fetch data from thingspeak");
  // }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chart')),
      // backgroundColor: Colors.green[800],
      body: SafeArea(
        child: LineChart(LineChartData(
            minX: 0,
            maxX: 2,
            minY: 0,
            maxY: 250,
            titlesData: FlTitlesData(
                bottomTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false))),
            gridData: FlGridData(
                show: true,
                getDrawingHorizontalLine: (value) {
                  return FlLine(strokeWidth: 1, color: Colors.black);
                },
                drawVerticalLine: true,
                getDrawingVerticalLine: (value) {
                  return FlLine(color: Colors.black, strokeWidth: 1);
                }),
            borderData: FlBorderData(show: true, border: Border.all(width: 1)),
            lineBarsData: [
              LineChartBarData(
                  spots: [FlSpot(0, 300), FlSpot(1, 200), FlSpot(2, 300)],
                  isCurved: true,
                  barWidth: 3)
            ])),
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

  // getSensorData() async {
  //   var url =
  //       "https://api.thingspeak.com/channels/1861455/feeds.json?api_key=CACC19YOE9ZU2AOQ&results=2";
  //   var response = await http.get(Uri.parse(url));

  //   if (response.statusCode == 200) {
  //     Channel channelData = channelFromMap(response.body);

  //     List<Feed> feedData = channelData.feeds;

  //     // return feedData[1].field1;
  //     return feedData;
  //   } else {
  //     throw Exception("failed to fetch data from thingspeak");
  //   }
  // }
}
