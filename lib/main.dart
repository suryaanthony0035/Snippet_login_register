import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snippet_login_regis_nodejs_api/page/home_page.dart';
import 'package:snippet_login_regis_nodejs_api/page/login_page.dart';
import 'package:snippet_login_regis_nodejs_api/page/register_page.dart';
import 'package:snippet_login_regis_nodejs_api/providers/cart_provider.dart';
import 'package:snippet_login_regis_nodejs_api/services/api_services.dart';
import 'package:snippet_login_regis_nodejs_api/services/shared_service.dart';

Widget _defaultHome = const LoginPage();

void main() async {
  SharedServices sharedServices = SharedServices();
  WidgetsFlutterBinding.ensureInitialized();
  bool _result = await sharedServices.isLoggedIn();

  if (_result) {
    _defaultHome = const HomePage();
  }

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => APIService()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CartProvider(),
        child: Builder(builder: (BuildContext context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Shopy',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            routes: {
              '/': (context) => _defaultHome,
              '/home': (context) => const HomePage(),
              '/login': (context) => const LoginPage(),
              '/register': (context) => const RegisterPage(),
            },
          );
        }));
  }
}
