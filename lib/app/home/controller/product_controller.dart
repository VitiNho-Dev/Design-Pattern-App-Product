import 'package:flutter/material.dart';

import 'package:app_product/app/home/model/product_model.dart';

abstract class IProductRepository {
  Future<List<ProductModel>> getAllProduct();
}

class ProductController extends ChangeNotifier {
  final IProductRepository _productRepository;

  ProductController({
    required IProductRepository productRepository,
  }) : _productRepository = productRepository {
    _getProducts();
  }

  List<ProductModel> products = [];

  void _getProducts() async {
    products = await _productRepository.getAllProduct();
    notifyListeners();
  }
}
