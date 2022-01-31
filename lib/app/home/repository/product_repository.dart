import 'package:app_product/app/home/controller/product_controller.dart';
import 'package:app_product/app/home/model/product_model.dart';

abstract class IProductDatasource {
  Future<List<Map<String, dynamic>>> getAllProducts();
}

class ProductRepositoryImp implements IProductRepository {
  final IProductDatasource datasource;

  ProductRepositoryImp({
    required this.datasource,
  });

  @override
  Future<List<ProductModel>> getAllProduct() async {
    final products = await datasource.getAllProducts();
    final product = products
        .map(
          (json) => ProductModel(
            id: json['id'],
            title: json['title'],
          ),
        )
        .toList();
    return product;
  }
}
