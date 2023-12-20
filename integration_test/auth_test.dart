import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:livescore/firebase_options.dart';
import 'package:livescore/screen/auth/auth_controller.dart';
import 'package:livescore/screen/auth/auth_screen.dart';
import 'package:livescore/services/notification_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUpAll(() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await Get.putAsync(() async => await SharedPreferences.getInstance());
    await FirebaseMessagingHandler().initPushNotification();
    Get.put(AuthController());
  });

  testWidgets('Dashboard UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AuthPage()));

    expect(find.text('Discover all about sport'), findsOneWidget);
    expect(
      find.text(
          'Search millions of jobs and get the inside scoop on companies Wait for what? Lets get start it!'),
      findsOneWidget,
    );
  });

  testWidgets('Signin & Signup UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AuthPage()));

    expect(find.text('Sign in'), findsWidgets);
    expect(find.text('Sign Up'), findsOneWidget);

    final signInButton = find.descendant(
      of: find.byType(Row),
      matching: find.text('Sign in'),
    );
    expect(signInButton, findsOneWidget);
    await tester.tap(signInButton);
    await tester.pumpAndSettle();

    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Forgot Password'), findsOneWidget);
    expect(find.text('Sign in'), findsWidgets);

    await tester.tap(find.byType(Material).first);
    await tester.pumpAndSettle();

    final signUpButton = find.descendant(
      of: find.byType(Row),
      matching: find.text('Sign Up'),
    );
    expect(signUpButton, findsOneWidget);
    await tester.tap(signUpButton);
    await tester.pumpAndSettle();

    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Sign up'), findsWidgets);
  });
}
