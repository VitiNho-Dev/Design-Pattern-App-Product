import 'package:app_product/app/services/client_interface.dart';

import 'package:app_product/app/home/repository/product_repository.dart';

class ProductDatasourceImp implements IProductDatasource {
  final IClient client;

  ProductDatasourceImp({
    required this.client,
  });

  @override
  Future<List<Map<String, dynamic>>> getAllProducts() async {
    final response = await client.get('http://localhost:3031/products');
    final products = List<Map<String, dynamic>>.from(response);
    return products;
  }
}
