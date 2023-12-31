import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


import 'package:grocerapp/features/user_auth/pages1/login_page.dart';
import 'package:grocerapp/features/user_auth/pages1/sign_up_page.dart';
import 'package:grocerapp/pages/HomePage.dart';
import 'package:grocerapp/pages/ItemPage.dart';
import 'package:grocerapp/pages/SplashScreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyCsQoDJg_Xyo9VJQZEv0XmS8ApqRWm_Wr0",
        appId:  "1:571154453634:web:bdfd64c9fef71b6bdc109b",
        messagingSenderId: "571154453634",
        projectId: "flutter-firebase-56357",
        // Your web Firebase config options
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My grocerApp',
      initialRoute: "/",
      routes: {
        "/": (context) => SplashScreen(
          seconds: 60,
          navigateAfterSeconds: LoginPage(),
          child: Container(), // Add a dummy child widget
        ),
        "/login": (context) => LoginPage(),
        "/singUp": (context) => SignUpPage(),
        "/homePage": (context) => HomePage(),
        "itemPage": (context) => ItemPage(),
      },
    );
  }
}