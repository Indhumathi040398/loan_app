// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Offers> welcomeFromJson(String str) =>
    List<Offers>.from(json.decode(str).map((x) => Offers.fromJson(x)));

String welcomeToJson(List<Offers> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Offers {
  Offers({
    required this.bank,
    required this.bankLogo,
    required this.interestRate,
    required this.tenure,
  });

  String bank;
  String bankLogo;
  double interestRate;
  double tenure;

  factory Offers.fromJson(Map<String, dynamic> json) => Offers(
        bank: json["bank"],
        bankLogo: json["bank_logo"],
        interestRate: json["interest_rate"]?.toDouble(),
        tenure: json["tenure"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "bank": bank,
        "bank_logo": bankLogo,
        "interest_rate": interestRate,
        "tenure": tenure,
      };
}
