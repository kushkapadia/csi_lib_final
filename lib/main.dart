import 'package:csi_library/cart_provider.dart';
import 'package:csi_library/home_page.dart';
import 'package:csi_library/second_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'loginRegister/login.dart';
import 'loginRegister/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(),
          debugShowCheckedModeBanner: false,
          initialRoute: 'homepage',
          routes: {
            'login': (context) => LoginPage(),
            'register': (context) => MyRegister(),
            'homepage': (context) => HomePage(),
          }),
    );
  }
}
