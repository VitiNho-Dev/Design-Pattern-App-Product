import 'package:dio/dio.dart';

import 'package:app_product/app/services/client_interface.dart';

class ClientDioImp implements IClient {
  final Dio dio;

  ClientDioImp({
    required this.dio,
  });

  @override
  Future get(String url) async {
    final response = await dio.get(url);
    return response.data;
  }
}
