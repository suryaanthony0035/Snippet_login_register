import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snippet_login_regis_nodejs_api/model/get_products/get_products.dart';

import '../../../color_config.dart';
import '../../../providers/homepage_view_model.dart';

enum SigninCharacter { fill, outline }

class ProductOverview extends StatefulWidget {
  final String productName;
  final String productImage;
  final String? productPrice;
  final String? productDescription;

  const ProductOverview({
    Key? key,
    required this.productName,
    required this.productImage,
    this.productPrice,
    this.productDescription,
  }) : super(key: key);

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  SigninCharacter _character = SigninCharacter.fill;

  Widget bottomNavigationBar({
    required Color iconColor,
    required Color backgroundColor,
    required Color color,
    required String title,
    required IconData iconData,
  }) {
    return Expanded(
        child: Container(
      padding: EdgeInsets.all(20),
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 17,
            color: iconColor,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: TextStyle(color: color),
          )
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GetProduct>(create: (context) {
      var viewmodels = GetProduct();
      viewmodels.getproducts();
      return viewmodels;
    }, builder: (context, viewmodels) {
      return Consumer<GetProduct>(builder: (context, viewmodels, _) {
        return Scaffold(
          bottomNavigationBar: Row(
            children: [
              bottomNavigationBar(
                  backgroundColor: textColor,
                  color: Colors.white70,
                  iconColor: Colors.grey,
                  title: "Add to Wishlist",
                  iconData: Icons.favorite_outline),
              bottomNavigationBar(
                backgroundColor: Colors.green,
                color: Colors.white,
                iconColor: Colors.white,
                title: "Go To Cart",
                iconData: Icons.shopping_bag,
              ),
            ],
          ),
          appBar: AppBar(
            backgroundColor: Colors.green,
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              "Product Overview",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: Text(widget.productName),
                  subtitle: Text("\₹${widget.productPrice}"),
                ),
                Container(
                  height: 250,
                  padding: EdgeInsets.all(40),
                  child: Image.network(widget.productImage),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: Text(
                    "Available Options",
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                        color: textColor, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.green[700],
                          ),
                          Radio<SigninCharacter>(
                            value: SigninCharacter.fill,
                            groupValue: _character,
                            activeColor: Colors.green[700],
                            onChanged: (value) {
                              setState(() {
                                _character = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      Text("\₹${widget.productPrice}"),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.add,
                              size: 15,
                              color: Colors.green,
                            ),
                            Text("ADD")
                          ],
                        ),
                      ),
                      // ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About this Product",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.productDescription.toString(),
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 16, color: textColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
    });
  }
}
