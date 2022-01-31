import 'package:app_product/app/home/controller/product_controller.dart';
import 'package:app_product/app/home/datasource/product_datasource.dart';
import 'package:app_product/app/home/view/product_page.dart';
import 'package:app_product/app/services/client_dio.dart';
import 'package:app_product/app/services/client_http.dart';
import 'package:app_product/app/services/client_interface.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'home/repository/product_repository.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Dio>(create: (context) => Dio()),
        Provider<IClient>(
          create: (context) => ClientDioImp(
            dio: Provider.of<Dio>(context, listen: false),
          ),
        ),
        // Provider<http.Client>(create: (context) => http.Client()),
        // Provider<IClient>(
        //   create: (context) => ClientHttpImp(
        //     client: Provider.of<http.Client>(context, listen: false),
        //   ),
        // ),
        Provider<IProductDatasource>(
          create: (context) => ProductDatasourceImp(
            client: Provider.of<IClient>(context, listen: false),
          ),
        ),
        Provider<IProductRepository>(
          create: (context) => ProductRepositoryImp(
            datasource: Provider.of<IProductDatasource>(context, listen: false),
          ),
        ),
        ChangeNotifierProvider<ProductController>(
          create: (context) => ProductController(
            productRepository:
                Provider.of<IProductRepository>(context, listen: false),
          ),
        ),
      ],
      child: const MaterialApp(
        home: ProductPage(),
      ),
    );
  }
}
