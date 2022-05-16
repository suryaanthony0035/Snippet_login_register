import 'package:flutter/material.dart';
import 'package:snippet_login_regis_nodejs_api/services/api_services.dart';
import 'package:snippet_login_regis_nodejs_api/services/shared_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter_Nodejs"),
        elevation: 0,
        actions: [
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
      ),
      backgroundColor: Colors.grey[200],
      body: userProfile(),
    );
  }

  Widget userProfile() {
    return FutureBuilder(
        future: APIService.getUserProfile(),
        builder: (BuildContext context, AsyncSnapshot<String> model) {
          if (model.hasData) {
            return Center(
              child: Text(model.data!),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
