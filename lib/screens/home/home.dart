// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('First app')),
        body: Column(children: [
          Container(
              margin: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      final docRef = db
                          .collection('Essentials')
                          .doc('Fh7wypHdxNHfa3BVRUIw');
                      docRef.get().then(
                        (DocumentSnapshot doc) {
                          final counter = doc.data()['order_counter'];
                          final queue = doc.data()['global_queue'];
                          // ignore: avoid_print
                          print(counter);
                          docRef.update({
                            "global_queue": FieldValue.arrayUnion([counter]),
                          });
                          int curr = queue[0];
                          // ignore: avoid_print
                          print("Your Order Number: $counter");
                          // ignore: avoid_print
                          print("Currently Processing: $curr");
                          docRef.update({'order_counter': counter + 1});
                        },
                        // ignore: avoid_print
                        onError: (e) => print("Error getting document: $e"),
                      );
                    });
                  },
                  child: const Text('Make an order'))),
        ]),
      ),
    );
  }
}
