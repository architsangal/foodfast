// ignore_for_file: must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:foodfast/constants.dart';
import 'package:foodfast/screens/providers/products_provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

class HeaderWithSearchBox extends StatelessWidget {
  List categories = [];

  HeaderWithSearchBox({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    Provider.of<ProductsProvider>(context).getcategories();
    categories = Provider.of<ProductsProvider>(context).categories;
    return Container(
      // It will cover 20% of our total heigh
      height: size.height * 0.2,
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 36 + kDefaultPadding,
            ),
            height: size.height * 0.24 - 27,
            decoration: const BoxDecoration(
              color: Color(0xFFCF4134),
              borderRadius: BorderRadius.only(
                  //  bottomLeft: Radius.circular(20),
                  // bottomRight: Radius.circular(20),
                  ),
            ),
          ),
          Positioned(
            top: 45,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        prefixIcon: const Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 201, 170, 170),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 116,
            left: 3,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 28,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Provider.of<ProductsProvider>(context, listen: false)
                            .updatecat(categories[index]);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 0),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFCF4134),
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(categories[index],
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
