import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:picogram/responsive/mobile_screen_layout.dart';
import 'package:picogram/responsive/responsive_layout.dart';
import 'package:picogram/responsive/web_screen_layout.dart';
import 'package:picogram/screens/signup_screen.dart';
import 'package:picogram/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyAnJgIBHOZIdz5R3xizlz_xPPp7Ku7McIU',
        appId: '1:619534021024:web:cd82a7fb011890eb9a34c5',
        messagingSenderId: '619534021024',
        projectId: 'picogram-d06ef',
        storageBucket: 'picogram-d06ef.appspot.com',
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      // home: const ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(),
      //   webScreenLayout: WebScreenLayout(),
      // ),
      home: const SignupScreen(),
    );
  }
}
