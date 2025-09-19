import 'package:dio/dio.dart';
import '../repositories/settings_repository.dart';

class HttpService {
  static final HttpService _instance = HttpService._internal();
  factory HttpService() => _instance;
  HttpService._internal();

  final Dio _dio = Dio();
  final SettingsRepository _settingsRepo = SettingsRepository();

  /// 获取带认证头的Dio实例
  Future<Dio> getAuthenticatedDio() async {
    final token = await _settingsRepo.getToken();
    final isTokenValid = await _settingsRepo.isTokenValid();
    
    if (token != null && isTokenValid) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    } else {
      _dio.options.headers.remove('Authorization');
    }
    
    return _dio;
  }

  /// 执行带认证的GET请求
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    final dio = await getAuthenticatedDio();
    return await dio.get(path, queryParameters: queryParameters);
  }

  /// 执行带认证的POST请求
  Future<Response> post(String path, {dynamic data, Map<String, dynamic>? queryParameters}) async {
    final dio = await getAuthenticatedDio();
    return await dio.post(path, data: data, queryParameters: queryParameters);
  }

  /// 执行带认证的PUT请求
  Future<Response> put(String path, {dynamic data, Map<String, dynamic>? queryParameters}) async {
    final dio = await getAuthenticatedDio();
    return await dio.put(path, data: data, queryParameters: queryParameters);
  }

  /// 执行带认证的DELETE请求
  Future<Response> delete(String path, {dynamic data, Map<String, dynamic>? queryParameters}) async {
    final dio = await getAuthenticatedDio();
    return await dio.delete(path, data: data, queryParameters: queryParameters);
  }

  /// 检查是否已登录且token有效
  Future<bool> isAuthenticated() async {
    return await _settingsRepo.isTokenValid();
  }

  /// 清除认证信息
  Future<void> clearAuth() async {
    _dio.options.headers.remove('Authorization');
  }
}
