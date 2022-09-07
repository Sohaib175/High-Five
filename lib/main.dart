import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_five/AuthModule/View/login_view.dart';
import 'package:high_five/Responsive/screenutil_init.dart';
import 'package:high_five/utill/Constants/const_color.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        theme: ThemeData(
            primaryColor: ConstColors.onPrimaryColor,
            secondaryHeaderColor: ConstColors.onPrimaryColor),
        debugShowCheckedModeBanner: false,
        title: 'High Five',
        home: LoginView(),
      ),
    );
  }
}