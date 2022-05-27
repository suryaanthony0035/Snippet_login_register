import 'package:flutter/material.dart';
import 'package:snippet_login_regis_nodejs_api/page/home_page.dart';
import 'package:snippet_login_regis_nodejs_api/page/myProfile/profile.dart';

class DrawerSide extends StatelessWidget {
  Widget listTile(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 32,
        color: Colors.green,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.green,
        ),
      ),
    );
  }

  const DrawerSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: 100,
        color: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white54,
                    radius: 43,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/placehld.png",
                      ),
                      radius: 40,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome Guest",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Container(
                        height: 30,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              side: MaterialStateProperty.all(BorderSide(
                                width: 2,
                                color: Colors.green,
                              ))),
                          onPressed: () {},
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            listTile(
                icon: Icons.home_outlined,
                title: "Home",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                }),
            listTile(
                icon: Icons.shopping_bag_outlined,
                title: "Review Cart",
                onTap: () {}),
            listTile(
                icon: Icons.person_outlined,
                title: "My Profile",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyProfile()));
                }),
            listTile(
                icon: Icons.notifications_outlined,
                title: "Notification",
                onTap: () {}),
            listTile(
                icon: Icons.star_outline,
                title: "Rating & Review",
                onTap: () {}),
            listTile(
                icon: Icons.favorite_outline, title: "Wishlist", onTap: () {}),
            listTile(
                icon: Icons.copy_outlined,
                title: "Raise a Complaint",
                onTap: () {}),
            listTile(
                icon: Icons.format_quote_outlined, title: "FAQs", onTap: () {}),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact Support",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Call Us"),
                      Text("+91 5448454845"),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text("Mail Us"),
                        SizedBox(width: 10),
                        Text("+91 5448454845"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
