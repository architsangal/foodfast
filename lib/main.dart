import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_core/firebase_core.dart';
import 'package:foodfast/screens/authenticate/sign_in.dart';
import 'package:foodfast/screens/providers/cart_provider.dart';
import 'package:foodfast/screens/providers/order_provider.dart';
import 'package:foodfast/screens/providers/products_provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ProductsProvider()),
        ChangeNotifierProvider.value(value: CartProvider()),
        ChangeNotifierProvider.value(value: OrderProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: App(),
      ),
    );
  }
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          return const SignIn(); //const verification_otp();
        });
  }
}
