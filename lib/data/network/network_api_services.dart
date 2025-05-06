import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart';
import 'package:tutorapp/data/app_exceptions.dart';
import 'package:tutorapp/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class NetworkApiServices extends BaseApiServices{

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }


  @override
  Future<dynamic>getApi(String url) async {

    if(kDebugMode){
      print(url);
    }
    dynamic returnResponse(http.Response response) {
      final responseJson = jsonDecode(response.body);

      switch (response.statusCode) {
        case 200:
        case 400:
          return responseJson;
        default:
          throw FetchUrlException(
            "Error Occurred while Communicated Server. StatusCode: ${response.statusCode}",
          );
      }
    }


    dynamic responseJson;
      try{
        final response= await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));

        responseJson= returnResponse(response);
      }on SocketException{
        throw InternetException("");
      }on TimeoutException{
        throw RequestTimeOut("");
      }


      return responseJson;
  }

  Future<dynamic> putApi(dynamic data, String url) async {
    final token = await _getToken();

    final headers = {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Token $token',
    };

    final body = jsonEncode(data);

    try {
      final response = await http.put(Uri.parse(url), body: body, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception('PUT API Error: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      throw Exception('PUT API Exception: $e');
    }
  }

  @override
  @override
  Future<dynamic> postApi(var data, String url, {bool requiresAuth = true}) async {
    if (kDebugMode) {
      print('POST URL: $url');
      print('POST Data: $data');
    }

    final token = requiresAuth ? await _getToken() : null;

    final headers = {
      'Content-Type': 'application/json',
      if (requiresAuth && token != null) 'Authorization': 'Token $token',
      if (dotenv.env['X-CSRFToken'] != null) 'X-CSRFToken': dotenv.env['X-CSRFToken']!,
    };

    dynamic responseJson;
    try {
      final response = await http
          .post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(data),
      )
          .timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException("");
    } on TimeoutException {
      throw RequestTimeOut("");
    }

    return responseJson;
  }



  dynamic returnResponse(http.Response response) {
    final responseJson = jsonDecode(response.body);

    switch (response.statusCode) {
      case 200:
        return {
          'statusCode': response.statusCode,
          'data': responseJson,
        };
      case 400:
        return {
          'statusCode': response.statusCode,
          'data': responseJson,
        };
      default:
        throw FetchUrlException(
          "Error Occurred while Communicated Server. StatusCode: ${response.statusCode}",
        );
    }
  }



  // dynamic returnResponse(http.Response response){
  //   switch(response.statusCode){
  //     case 200:
  //       dynamic responseJson=jsonDecode(response.body);
  //       return responseJson;
  //     case 400:
  //       dynamic responseJson=jsonDecode(response.body);
  //       return responseJson;
  //     default:
  //       throw FetchUrlException("Error Occurred while Communicated Server StatusCode : "+response.statusCode.toString());
  //
  //   }
  // }

}