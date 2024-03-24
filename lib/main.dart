import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:h1/controller/getex_binding.dart';
import 'package:h1/function/functions.dart';
import 'package:h1/screens/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding:Intailization(),
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: const splashScreen(),
    );
  }
}
