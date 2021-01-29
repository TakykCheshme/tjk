import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class Network {
  Dio _dio;

  DioCacheManager _dioCacheManager;
  Options _cacheOptions;

  Network() {
    _dio = Dio();
    _dioCacheManager = DioCacheManager(CacheConfig());
    _dio.options.baseUrl = "https://tjk.com.tm/gala/tjk/customapi";
    // _dio.options.connectTimeout = 5000;
    // _dio.options.receiveTimeout = 3000;
    _dio.interceptors.add(_dioCacheManager.interceptor);
    _cacheOptions = buildCacheOptions(Duration(days: 7));
  }

  Future<Map<String, dynamic>> getHome(String ln) async {
    Response response = await _dio.get(
      "/index.php",
      queryParameters: {"language": ln},
      options: _cacheOptions,
    );
    return jsonDecode(response.data);
  }

  Future<Map<String, dynamic>> getDetail({int id, int categoryId}) async {
    Response response = await _dio.get(
      "/product.php",
      queryParameters: {
        "id": id,
        "category": categoryId,
        "language": "ru",
      },
      options: _cacheOptions,
    );

    return jsonDecode(response.data);
  }

  Future<Map<String, dynamic>> getSearch(String word, String ln) async {
    Response response = await _dio.get(
      "/search.php",
      queryParameters: {"language": ln, "word": word},
      options: _cacheOptions,
    );
    return jsonDecode(response.data);
  }

  Future<int> orderCreate({
    String language,
    String address,
    String phone,
    double totalPaid,
    String paymentMethod,
    String orders,
    String description,
    String note,
  }) async {
    Response response = await _dio.post(
      "/order_create.php",
      data: {
        "language": language,
        "address": address,
        "phone": phone,
        "totalPaid": totalPaid,
        "paymentMethod": paymentMethod,
        "orders": orders,
        "description": description,
        "note": note,
      },
    );
    return response.statusCode;
  }
}
