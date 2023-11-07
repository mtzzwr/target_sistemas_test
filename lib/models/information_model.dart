import 'dart:convert';

class InformationModel {
  String? uid;
  String? text;

  InformationModel({
    this.uid,
    this.text,
  });

  factory InformationModel.fromJson(Map json) => InformationModel(
        uid: json['uid'],
        text: json['text'],
      );

  static Map<String, dynamic> toJson(InformationModel informationModel) => {
        'uid': informationModel.uid,
        'text': informationModel.text,
      };

  static String encode(List<InformationModel> informations) => json.encode(
        informations.map((e) => InformationModel.toJson(e)).toList(),
      );

  static List<InformationModel> decode(String informations) =>
      (json.decode(informations) as List<dynamic>)
          .map((e) => InformationModel.fromJson(e))
          .toList();
}
