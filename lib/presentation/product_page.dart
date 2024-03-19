import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_sample/application/product_controller.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (c) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Product Page"),
          ),
          body: c.isLoading? const Center(child: CircularProgressIndicator()):
          ListView.builder(
              itemCount: c.products.length,
              itemBuilder: (_,index) {
                var product = c.products[index];
            return ListTile(title: Text(product.name ?? ""),);
          })
        );
      }
    );
  }
}
