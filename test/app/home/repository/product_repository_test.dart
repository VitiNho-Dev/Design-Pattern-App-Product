import 'package:app_product/app/home/datasource/product_datasource.dart';
import 'package:app_product/app/home/repository/product_repository.dart';
import 'package:app_product/app/services/client_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Deve retornar os produtos', () async {
    final dio = Dio();
    final client = ClientDioImp(dio: dio);
    final IProductDatasource datasource = ProductDatasourceImp(client: client);
    final service = ProductRepositoryImp(datasource: datasource);
    final product = await service.getAllProduct();
    expect(product[0].title, 'Flutter 2');
  });
}
