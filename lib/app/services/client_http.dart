import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:app_product/app/services/client_interface.dart';

class ClientHttpImp implements IClient {
  final http.Client client;

  ClientHttpImp({
    required this.client,
  });

  @override
  Future get(String url) async {
    final response = await client.get(Uri.parse(url));
    return jsonDecode(response.body);
  }
}
