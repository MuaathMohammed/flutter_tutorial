import 'package:dio/dio.dart';

import 'DioClient.dart';

class ApiService {
  final DioClient _client = DioClient();

  //dyanamic post
  Future<dynamic> post(String url, {Object? data, Options? options}) async {
    options ??= Options(
      headers: {
        'Content-Type': 'multipart/form-data',
      },
    );

    Response response = await _client.dio.post(
      url,
      data: data,
      options: options,
    );
    return response;
  }

  //dynamic get
  Future<dynamic> get(String url) async {
    return await _client.dio.get(url);
  }

  //dynamic put
  Future<dynamic> put(String url, {Object? data, Options? options}) async {
    Response response = await _client.dio.put(
      url,
      data: data,
      options: options,
    );
    return response;
  }

  Future<dynamic> delete(String url) async {
    Options _options = Options(
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json',
      },
    );

    return await _client.dio.delete(url);
  }
}