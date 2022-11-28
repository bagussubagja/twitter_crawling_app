// To parse this JSON data, do
//
//     final generateWordCloudModel = generateWordCloudModelFromJson(jsonString);

import 'dart:convert';

GenerateWordCloudModel generateWordCloudModelFromJson(String str) => GenerateWordCloudModel.fromJson(json.decode(str));

String generateWordCloudModelToJson(GenerateWordCloudModel data) => json.encode(data.toJson());

class GenerateWordCloudModel {
    GenerateWordCloudModel({
        this.query,
        this.total,
        this.image,
    });

    String? query;
    int? total;
    String? image;

    factory GenerateWordCloudModel.fromJson(Map<String, dynamic> json) => GenerateWordCloudModel(
        query: json["query"],
        total: json["total"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "query": query,
        "total": total,
        "image": image,
    };
}
