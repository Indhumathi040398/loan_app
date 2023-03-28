import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';
import '../models/user_application.dart';
import '../models/user_model.dart';
import '../models/user_offer_model.dart';

class ApiService {
  Future<List<Offers>?> getUsersOffers(String offersUrl) async {
    try {
      var url = Uri.parse(offersUrl.replaceAll("api/", ""));
      var response = await http.get(url, headers: {
        "Authorization":
            "1251a1de9906a858d1fc697792a5f5a7065a5fe984a159b1d3c3bbea160aa39b"
      });
      if (response.statusCode == 200) {
        List<Offers> _model = welcomeFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<UserModel?> getUser() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.userEndPoint);
      var response = await http.get(url, headers: {
        "Authorization":
            "1251a1de9906a858d1fc697792a5f5a7065a5fe984a159b1d3c3bbea160aa39b"
      });
      if (response.statusCode == 200) {
        UserModel user = UserModel.fromJson(json.decode(response.body));
        return user;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<UserApplication>?> getUsersApplication() async {
    try {
      var url = Uri.parse(
          ApiConstants.baseUrl + ApiConstants.userApplicationEndPoint);
      var response = await http.get(url, headers: {
        "Authorization":
            "1251a1de9906a858d1fc697792a5f5a7065a5fe984a159b1d3c3bbea160aa39b"
      });
      if (response.statusCode == 200) {
        List<UserApplication> _modelUserApplication =
            userApplicationFromJson(response.body);
        return _modelUserApplication;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
