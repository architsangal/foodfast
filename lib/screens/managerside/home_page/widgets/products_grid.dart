import 'package:flutter/material.dart';
import 'package:foodfast/screens/managerside/home_page/widgets/product_grid_item.dart';
import 'package:foodfast/screens/providers/order_provider.dart';
import 'package:foodfast/screens/providers/products_provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

class ProductsGrid extends StatefulWidget {
  const ProductsGrid({Key? key}) : super(key: key);

  @override
  State<ProductsGrid> createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  @override
  Widget build(BuildContext context) {
    // listen to ProductsProvider to get all products list
    Provider.of<ProductsProvider>(context).getproducts();
    Provider.of<OrderProvider>(context).getorder();
    final products = Provider.of<ProductsProvider>(context).products;

    return SizedBox(
        height: MediaQuery.of(context).size.height,
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
