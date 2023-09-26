import 'package:flutter/material.dart';
import 'package:foodfast/screens/userside/home/widgets/product_grid_item.dart';
import 'package:foodfast/screens/providers/products_provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // listen to ProductsProvider to get all products list
    Provider.of<ProductsProvider>(context).getproducts();

    final products = Provider.of<ProductsProvider>(context).products;
    //   final cat = Provider.of<ProductsProvider>(context).cat;
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.69,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: products.length,
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
            itemBuilder: (context, index) {
              // Listen to specific object (cart item).
              return ChangeNotifierProvider.value(
                value: products[index],
                child: ProductGridItem(index),
              );
            }));
  }
}
