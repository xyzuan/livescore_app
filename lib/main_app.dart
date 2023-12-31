import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livescore/routes/pages_names.dart';
import 'package:livescore/routes/pages_routes.dart';
import 'package:livescore/screen/auth/auth_controller.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:
          _authController.isLogged.value ? PageName.home : PageName.auth,
      getPages: PageRoutes.pages,
      builder: (BuildContext context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child ?? Container(),
        );
      },
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF181829),
      ),
    );
  }
}
