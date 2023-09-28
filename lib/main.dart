import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:livescore/main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xFF181829),
  ));

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}
