// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodfast/screens/userside/models/product.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';

class ProductsProvider with ChangeNotifier {
  late List<Product> _products = [];
  late List<Product> _allproducts = [];
  late List<String> _categories = [];
  late String cat = "Beverages";
  Future<void> getproducts() async {
    print("PRODUCTS BOUGHT IN");
    List<Product> stuffList = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Products').get();
    for (var element in querySnapshot.docs) {
      Product p = Product(
          id: element.data()['id'],
          title: element.data()['title'],
          description: element.data()['description'],
          price: element.data()['price'],
          category: element.data()['category'],
          availability: element.data()['availability']);
      stuffList.add(p);
      _allproducts = stuffList;
      _products = _allproducts
          .where((element) =>
              element.category == cat && element.availability == "available")
          .toList();
    }

    notifyListeners();
  }

  void updatecat(String category) {
    cat = category;
    _products = _allproducts
        .where((element) =>
            element.category == cat && element.availability == "available")
        .toList();
    print(_products[0].title);
  }

  // getterss
  //  List<Product> get products => [..._products];
  List<Product> get products {
    return _products;
  }

  /*
  Future<void> addProduct(Product product) {
    const String url =
        "https://flutter-shop-7ddca.firebaseio.com/products.json";
    return http
        .post(url,
            body: json.encode({
              'title': product.title,
              'description': product.description,
              'price': product.price,
            }))
        .then((response) {
      _products.add(product);
      notifyListeners();
    }).catchError((err) {
      // Print Something ...
    });
  } 
  */
  Future<void> getcategories() async {
    List<String> categorieslist = [];

    await FirebaseFirestore.instance
        .collection('Categories')
        .doc('4EBLTAvUgm8FvVtr9IGu')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        categorieslist = List.from(documentSnapshot['category_list']);
      }
    });
    _categories = categorieslist;
    notifyListeners();
  }

  List<String> get categories {
    return _categories;
  }

  void updateProduct(String id, Product product) {
    final productIndex = _products.indexWhere((prod) => prod.id == id);
    if (productIndex >= 0) {
      _products[productIndex] = product;
      notifyListeners();
    }
  }

  void deleteProduct(String id) {
    _products.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }

  Product findProductById(String id) {
    return _products.firstWhere((product) => product.id == id);
  }
}
