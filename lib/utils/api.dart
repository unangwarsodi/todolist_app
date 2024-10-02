import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as p_dio;
import 'package:todo_list_app/utils/json.dart';

import '../models/checklist.dart';
import '../models/item.dart';
import 'instance_pref.dart';

class Api {
  final String baseUrl = '94.74.86.174:8080';

  Future<dynamic> _fetchRequest(
      Uri uri,
      {
        String method = 'GET',
        Map? bodyJson,
        Object? body,
        dynamic formData,
        p_dio.ResponseType? responseType,
        String? token,
      }
      ) async {
    String exception = 'Cannot connect server!';

    try {
      dynamic data;

      ContentType? contentType;
      if (bodyJson != null) {
        contentType = ContentType('application', 'json', charset: 'utf-8');
        data = json.encode(bodyJson);
      } else if (body != null) {
        data = body;
      } else if (formData != null) {
        data = formData;
      }

      p_dio.Dio dio = p_dio.Dio();

      Map<String, dynamic>? headers;

      if (token != null) {
        headers = {
          'Authorization': "Bearer $token"
        };
      }

      p_dio.Options options = p_dio.Options(
        method: method,
        contentType: contentType.toString(),
        sendTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        receiveDataWhenStatusError: true,
        responseType: responseType,
        headers: headers
      );

      final response = await dio.requestUri(
        uri,
        data: data,
        options: options,
      );

      if (response.data != null) {
        return response.data;
      } else {
        exception = 'Empty message';
      }
    } on p_dio.DioException catch (error) {
      exception = 'Server is busy';
    }

    throw(exception);
  }

  Future<String> login({
    required String username,
    required String password
  }) async {
    Uri url = Uri.http(
        baseUrl,
        '/api/login',
    );

    Map json = {
      'username': username,
      'password': password
    };

    return _fetchRequest(url, method: 'POST', bodyJson: json)
    .then((dynamic result) {
      Map<String, dynamic> map = result;
      if (map.containsKey('data') && map['data'] != null) {
        return map['data']['token'];
      } else if (map.containsKey('errorMessage')) {
        throw(map['errorMessage']);
      } else {
        throw('Server response failed. Please try again!');
      }
    });
  }

  Future<bool> register({
    required String email,
    required String username,
    required String password
  }) async {
    Uri url = Uri.http(
      baseUrl,
      '/api/register',
    );

    Map json = {
      'email': email,
      'username': username,
      'password': password
    };

    return _fetchRequest(url, method: 'POST', bodyJson: json)
    .then((dynamic result) {
      Map<String, dynamic> map = result;
      if (map.containsKey('statusCode') && map['statusCode'] == 2000) {
        return true;
      } else if (map.containsKey('errorMessage')) {
        throw(map['errorMessage']);
      } else {
        throw('Server response failed. Please try again!');
      }
    });
  }

  Future<List<Checklist>> fetchChecklistAll() async {
    Uri url = Uri.http(
      baseUrl,
      '/api/checklist',
    );

    return _fetchRequest(url, method: 'GET', token: InstancePref.getToken())
    .then((dynamic result) {
      Map<String, dynamic> map = result;
      if (map.containsKey('statusCode') && map['statusCode'] == 2100) {
        return parseListFromMap<Checklist>(map, 'data');
      } else if (map.containsKey('errorMessage')) {
        throw(map['errorMessage']);
      } else {
        throw('Server response failed. Please try again!');
      }
    });
  }

  Future<bool> deleteChecklist(int id) async {
    Uri url = Uri.http(
      baseUrl,
      '/api/checklist/$id',
    );

    return _fetchRequest(url, method: 'DELETE', token: InstancePref.getToken())
    .then((dynamic result) {
      Map<String, dynamic> map = result;
      if (map.containsKey('statusCode') && map['statusCode'] == 2300) {
        return true;
      } else if (map.containsKey('errorMessage')) {
        throw(map['errorMessage']);
      } else {
        throw('Server response failed. Please try again!');
      }
    });
  }

  Future<bool> createChecklist({
    required String name,
  }) async {
    Uri url = Uri.http(
      baseUrl,
      '/api/checklist',
    );

    Map json = {
      'name': name,
    };

    return _fetchRequest(url, method: 'POST', bodyJson: json, token: InstancePref.getToken())
    .then((dynamic result) {
      Map<String, dynamic> map = result;
      if (map.containsKey('statusCode') && map['statusCode'] == 2000) {
        return true;
      } else if (map.containsKey('errorMessage')) {
        throw(map['errorMessage']);
      } else {
        throw('Server response failed. Please try again!');
      }
    });
  }

  Future<List<Item>> fetchChecklistItemAll(int checklistId) async {
    Uri url = Uri.http(
      baseUrl,
      '/api/checklist/$checklistId/item',
    );

    return _fetchRequest(url, method: 'GET', token: InstancePref.getToken())
    .then((dynamic result) {
      Map<String, dynamic> map = result;
      if (map.containsKey('statusCode') && map['statusCode'] == 2000) {
        return parseListFromMap<Item>(map, 'data');
      } else if (map.containsKey('errorMessage')) {
        throw(map['errorMessage']);
      } else {
        throw('Server response failed. Please try again!');
      }
    });
  }

  Future<bool> deleteChecklistItem({required int checklistId, required int itemId}) async {
    Uri url = Uri.http(
      baseUrl,
      '/api/checklist/$checklistId/item/$itemId',
    );

    return _fetchRequest(url, method: 'DELETE', token: InstancePref.getToken())
    .then((dynamic result) {
      Map<String, dynamic> map = result;
      if (map.containsKey('statusCode') && map['statusCode'] == 2300) {
        return true;
      } else if (map.containsKey('errorMessage')) {
        throw(map['errorMessage']);
      } else {
        throw('Server response failed. Please try again!');
      }
    });
  }
}