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
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      print('GET URL: $url');
    }

    final token = await _getToken();

    dynamic returnResponse(http.Response response) {
      final responseJson = jsonDecode(response.body);

      switch (response.statusCode) {
        case 200:
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

    dynamic responseJson;

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Token $token',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException("");
    } on TimeoutException {
      throw RequestTimeOut("");
    }

    return responseJson;
  }


  Future<dynamic> putMultipartApi({
    required String url,
    required Map<String, String> fields,
    File? nidImage,
    File? profileImage,
  }) async {
    final token = await _getToken();

    final request = http.MultipartRequest('PUT', Uri.parse(url))
      ..headers.addAll({
        'Authorization': 'Token $token',
      })
      ..fields.addAll(fields);

    if (nidImage != null) {
      request.files.add(await http.MultipartFile.fromPath('nidcard_picture', nidImage.path));
    }

    if (profileImage != null) {
      request.files.add(await http.MultipartFile.fromPath('profile_picture', profileImage.path));
    }

    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception('PUT API Error: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      throw Exception('PUT Multipart API Exception: $e');
    }
  }

  Future<dynamic> postApimulti({
    required String url,
    required Map<String, String> fields,
    Map<String, File>? files,
  }) async {
    final token = await _getToken();
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers['Authorization'] = 'Token $token';
      // Add fields
      request.fields.addAll(fields);
      // Add files
      if (files != null) {
        for (var entry in files.entries) {
          request.files.add(await http.MultipartFile.fromPath(entry.key, entry.value.path));
        }
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception('POST Multipart API Error: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      throw Exception('POST API Exception: $e');
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