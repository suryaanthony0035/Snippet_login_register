import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:snippet_login_regis_nodejs_api/page/Home/drawer.dart';
import 'package:snippet_login_regis_nodejs_api/page/Home/product_overview/product_overview.dart';
import 'package:snippet_login_regis_nodejs_api/page/Home/single_products.dart';
import 'package:snippet_login_regis_nodejs_api/services/api_services.dart';
import 'package:snippet_login_regis_nodejs_api/services/shared_service.dart';

import '../config.dart';
import '../model/get_product_img/payload.dart';
import '../model/get_products/payload.dart';
import '../providers/homepage_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildHerbsProduct(context, List<ImgPayload> imgPayload) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Herbs Seasonings"),
              Text(
                "View all",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: List.generate(imgPayload.length, (index) {
            var model = imgPayload[index];
            return SignleProduct(
              onTaps: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductOverview(
                      productImage: (model.img?.startsWith("http") ?? false)
                          ? model.img ?? ""
                          : "${Config.getImageUrl}${model.img}",
                      productName: model.name ?? "",
                    ),
                  ),
                );
              },
              productImage: (model.img?.startsWith("http") ?? false)
                  ? model.img ?? ""
                  : "${Config.getImageUrl}${model.img}",
              productName: model.name ?? "",
            );
          })),
        ),
      ],
    );
  }

  Widget _buildFreshProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Fresh Fruits"),
              Text(
                "View all",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SignleProduct(
                onTaps: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductOverview(
                        productImage: "assets/images/apple1.png",
                        productName: "Apple ",
                      ),
                    ),
                  );
                },
                productImage: 'assets/images/apple1.png',
                productName: 'Fresh mint',
              ),
              SignleProduct(
                onTaps: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductOverview(
                        productImage: "assets/images/orange.png",
                        productName: "Orange ",
                      ),
                    ),
                  );
                },
                productImage: 'assets/images/orange.png',
                productName: 'Fresh mint',
              ),
              SignleProduct(
                onTaps: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductOverview(
                        productImage: "assets/images/banana.png",
                        productName: "Banana ",
                      ),
                    ),
                  );
                },
                productImage: 'assets/images/banana.png',
                productName: 'Fresh mint',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVegtableProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Fresh Vegtables"),
              Text(
                "View all",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SignleProduct(
                onTaps: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductOverview(
                        productImage: "assets/images/carat.png",
                        productName: "Carrot ",
                      ),
                    ),
                  );
                },
                productImage: 'assets/images/carat.png',
                productName: 'Carrot',
              ),
              SignleProduct(
                onTaps: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductOverview(
                        productImage: "assets/images/onion.png",
                        productName: "Onion ",
                      ),
                    ),
                  );
                },
                productImage: 'assets/images/onion.png',
                productName: 'Onion',
              ),
              SignleProduct(
                onTaps: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductOverview(
                        productImage: "assets/images/img3.png",
                        productName: "Aubergine ",
                      ),
                    ),
                  );
                },
                productImage: 'assets/images/img3.png',
                productName: 'Aubergine',
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GetProduct>(create: (context) {
      var viewmodel = GetProduct();
      viewmodel.getproducts();
      return viewmodel;
    }, builder: (context, viewmodel) {
      return Consumer<GetProduct>(builder: (context, viewmodel, _) {
        return Scaffold(
          drawer: Drawer(
            child: DrawerSide(),
          ),
          appBar: AppBar(
            title: const Text("Shopy"),
            elevation: 0,
            actions: [
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.search,
                  size: 17,
                  color: HexColor("#59981A"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.shopping_bag,
                    size: 17,
                    color: HexColor("#59981A"),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  SharedServices.logout(context);
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
              ),
            ],
            backgroundColor: HexColor("#59981A"),
          ),
          backgroundColor: Color(0xffcbcbcb),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: ListView(
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.5), BlendMode.srcOver),
                          image: AssetImage(
                            "assets/images/veg.jpg",
                          ),
                          fit: BoxFit.cover),
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          // color: Colors.red,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 120),
                                child: Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(50),
                                      bottomLeft: Radius.circular(50),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Shopy",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        shadows: [
                                          BoxShadow(
                                              color: Colors.green,
                                              blurRadius: 10,
                                              offset: Offset(3, 3))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "30% Off",
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: Text(
                                  "All Vegetables Products ",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                    ],
                  ),
                ),
                _buildHerbsProduct(context, viewmodel.imgPayload),
                _buildFreshProduct(),
                _buildVegtableProduct()
                // userProfile(),
              ],
            ),
          ),
        );
      });
    });
  }

  // Widget userProfile() {
  //   return FutureBuilder(
  //       future: APIService.getUserProfile(),
  //       builder: (BuildContext context, AsyncSnapshot<String> model) {
  //         if (model.hasData) {
  //           return Center(
  //             child:
  //                 // print(model.data),
  //                 Text(
  //               model.data!,
  //               style: TextStyle(color: Colors.black, fontSize: 20),
  //             ),
  //           );
  //         }
  //         return const Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       });
  // }
}
