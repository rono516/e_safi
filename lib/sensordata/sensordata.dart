import 'package:http/http.dart' as http;
import 'package:wasteapp/models/channel.dart';

class SensorData {
  getSensorDataFunction() async {
    var url =
        "https://api.thingspeak.com/channels/1861455/feeds.json?api_key=CACC19YOE9ZU2AOQ&results=2";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Channel channelData = channelFromMap(response.body);

      List<Feed> feedData = channelData.feeds;

      // return feedData[1].field1;
      return feedData;
    } else {
      throw Exception("failed to fetch data from thingspeak");
    }
  }

  getFirstSensorValue() async {
    var url =
        "https://api.thingspeak.com/channels/1861455/feeds.json?api_key=CACC19YOE9ZU2AOQ&results=2";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Channel channelData = channelFromMap(response.body);

      List<Feed> feedData = channelData.feeds;

      return double.parse(feedData[0].field1);
      //return feedData;
    } else {
      throw Exception("failed to fetch data from thingspeak");
    }
  }

  getSecondSensorValue() async {
    var url =
        "https://api.thingspeak.com/channels/1861455/feeds.json?api_key=CACC19YOE9ZU2AOQ&results=2";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Channel channelData = channelFromMap(response.body);

      List<Feed> feedData = channelData.feeds;

      return feedData[1].field1;
      // return feedData;
    } else {
      throw Exception("failed to fetch data from thingspeak");
    }
  }
}
