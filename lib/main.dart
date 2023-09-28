import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:livescore/main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}
