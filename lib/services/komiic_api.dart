import 'package:dio/dio.dart';

class KomiicApi {
  KomiicApi({Dio? dio}) : _dio = dio ?? Dio();

  static const String endpoint = 'https://komiic.com/api/query';

  final Dio _dio;

  Future<Response<dynamic>> postGraphQL({
    required String query,
    Map<String, dynamic>? variables,
  }) async {
    final payload = {
      'query': query,
      if (variables != null) 'variables': variables,
    };
    return _dio.post(endpoint, data: payload);
  }
}


