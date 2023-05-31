import 'package:dio/dio.dart';
import 'package:flutter_clean_api_request/core/utils/constants.dart';

class ApiProvider {
  final Dio _dio = Dio();

  Future<dynamic> fetchPostsData() async {
    var response = await _dio.get(Constants.postsUrl);

    return response;
  }
}
