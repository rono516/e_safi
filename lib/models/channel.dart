// To parse this JSON data, do
//
//     final channel = channelFromMap(jsonString);

import 'dart:convert';

Channel channelFromMap(String str) => Channel.fromMap(json.decode(str));

String channelToMap(Channel data) => json.encode(data.toMap());

class Channel {
  Channel({
    required this.channel,
    required this.feeds,
  });

  ChannelClass channel;
  List<Feed> feeds;

  factory Channel.fromMap(Map<String, dynamic> json) => Channel(
        channel: ChannelClass.fromMap(json["channel"]),
        feeds: List<Feed>.from(json["feeds"].map((x) => Feed.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "channel": channel.toMap(),
        "feeds": List<dynamic>.from(feeds.map((x) => x.toMap())),
      };
}

class ChannelClass {
  ChannelClass({
    required this.id,
    required this.name,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.field1,
    required this.createdAt,
    required this.updatedAt,
    required this.lastEntryId,
  });

  int id;
  String name;
  String description;
  String latitude;
  String longitude;
  String field1;
  DateTime createdAt;
  DateTime updatedAt;
  int lastEntryId;

  factory ChannelClass.fromMap(Map<String, dynamic> json) => ChannelClass(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        field1: json["field1"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        lastEntryId: json["last_entry_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "latitude": latitude,
        "longitude": longitude,
        "field1": field1,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "last_entry_id": lastEntryId,
      };
}

class Feed {
  Feed({
    required this.createdAt,
    required this.entryId,
    required this.field1,
  });

  DateTime createdAt;
  int entryId;
  String field1;

  factory Feed.fromMap(Map<String, dynamic> json) => Feed(
        createdAt: DateTime.parse(json["created_at"]),
        entryId: json["entry_id"],
        field1: json["field1"],
      );

  Map<String, dynamic> toMap() => {
        "created_at": createdAt.toIso8601String(),
        "entry_id": entryId,
        "field1": field1,
      };
}
