// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:loan_app/models/user_model.dart';

List<UserApplication> userApplicationFromJson(String str) => List<UserApplication>.from(json.decode(str).map((x) => UserApplication.fromJson(x)));

String userApplicationToJson(List<UserApplication> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserApplication {
    UserApplication({
        required this.university,
        required this.loanAmount,
        required this.offersUrl,
    });

    String university;
    double loanAmount;
    String offersUrl;

    factory UserApplication.fromJson(Map<String, dynamic> json) => UserApplication(
        university: json["university"],
        loanAmount: json["loan_amount"]?.toDouble(),
        offersUrl: json["offers_url"],
    );

    Map<String, dynamic> toJson() => {
        "university": university,
        "loan_amount": loanAmount,
        "offers_url": offersUrl,
    };
}
