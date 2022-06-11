import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snippet_login_regis_nodejs_api/local_db/db_helper.dart';
import 'package:snippet_login_regis_nodejs_api/model/addtocart/addtocart.dart';
import 'package:snippet_login_regis_nodejs_api/providers/cart_provider.dart';

class SignleProduct extends StatefulWidget {
  final String? productName;
  final String? productImage;
  final String? productPrice;

  final Function() onTaps;

  SignleProduct({
    Key? key,
    required this.productName,
    required this.productImage,
    required this.onTaps,
    required this.productPrice,
  }) : super(key: key);

  @override
  State<SignleProduct> createState() => _SignleProductState();
}

class _SignleProductState extends State<SignleProduct> {
  DBHelper dbHelper = DBHelper();

  final itemsKG = ['1Kg', '2Kg', '3Kg', '4Kg', '5Kg'];

  String? value = '1Kg';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            // height: 230,
            height: 250,
            width: 160,
            decoration: BoxDecoration(
              color: Color(0xffd9dad9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: widget.onTaps,
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: Image.network(widget.productImage!),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productName!,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        // Spacer(),
                        Text(
                          // "MRP:\₹50",
                          "\$${widget.productPrice.toString()}",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        Row(
                          children: [
                            Expanded(
                                child: DropdownButton(
                              value: value,
                              isExpanded: true,
                              iconSize: 30,
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                              ),
                              items: itemsKG.map(buildMenuItem).toList(),
                              // onChanged: (String? value) =>
                              //     setState(() => this.value = value as String),
                              onChanged: (value) {
                                setState(() {
                                  this.value = value as String;
                                });
                              },
                            )),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                height: 30,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    dbHelper.insert(Cart(
                                      id: value,
                                      productId: value.toString(),
                                      name: value.toString(),
                                      price: value.toString(),
                                      cloudinaryid: value.toString(),
                                      quantity: value.toString(),
                                      unitTag: value.toString(),
                                      img: value.toString(),
                                    ));
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.only(top: 2),
                                        child: Text(
                                          "ADD",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Icon(
                                        Icons.shopping_bag,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 8),
      ));
}
