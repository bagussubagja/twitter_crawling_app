// To parse this JSON data, do
//
//     final trendsModel = trendsModelFromJson(jsonString);

import 'dart:convert';

TrendsModel trendsModelFromJson(String str) => TrendsModel.fromJson(json.decode(str));

String trendsModelToJson(TrendsModel data) => json.encode(data.toJson());


class TrendsModel {
    TrendsModel({
        this.trends,
        this.asOf,
        this.createdAt,
        this.locations,
    });

    List<Trend>? trends;
    DateTime? asOf;
    DateTime? createdAt;
    List<Location>? locations;

    factory TrendsModel.fromJson(Map<String, dynamic> json) => TrendsModel(
        trends: List<Trend>.from(json["trends"].map((x) => Trend.fromJson(x))),
        asOf: DateTime.parse(json["as_of"]),
        createdAt: DateTime.parse(json["created_at"]),
        locations: List<Location>.from(json["locations"].map((x) => Location.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "trends":trends,
        "as_of": asOf,
        "created_at": createdAt,
        "locations": locations,
    };
}

class Location {
    Location({
        this.name,
        this.woeid,
    });

    String? name;
    int? woeid;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        woeid: json["woeid"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "woeid": woeid,
    };
}

class Trend {
    Trend({
        this.name,
        this.url,
        this.promotedContent,
        this.query,
        this.tweetVolume,
    });

    String? name;
    String? url;
    dynamic promotedContent;
    String? query;
    int? tweetVolume;

    factory Trend.fromJson(Map<String, dynamic> json) => Trend(
        name: json["name"],
        url: json["url"],
        promotedContent: json["promoted_content"],
        query: json["query"],
        tweetVolume: json["tweet_volume"] == null ? null : json["tweet_volume"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "promoted_content": promotedContent,
        "query": query,
        "tweet_volume": tweetVolume == null ? null : tweetVolume,
    };
}
