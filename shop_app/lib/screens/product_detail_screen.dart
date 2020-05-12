import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routerName = '/ProductDetailScreen';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 300,
                child: Image.network(
                  loadedProduct.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Text('\$${loadedProduct.price}'),
              SizedBox(height: 10),
              Text(
                loadedProduct.description,
                textAlign: TextAlign.center,
                softWrap: true,
              )
            ],
          ),
        ));
  }
}
