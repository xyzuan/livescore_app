import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:integration_test/integration_test.dart';
import 'package:livescore/main_app.dart';
import 'package:livescore/screen/auth/auth_screen.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());

  // testWidgets('SplashScreen displays UI elements', (WidgetTester tester) async {
  //   await tester.pumpWidget(GetMaterialApp(
  //     home: SplashPage(),
  //   ));
  //   expect(find.byType(Column), findsOneWidget);
  // });

  testWidgets('AuthPage displays UI elements', (WidgetTester tester) async {
    await tester.pumpWidget(GetMaterialApp(
      home: AuthPage(),
    ));
    expect(find.text('LiveScore'), findsOneWidget);
  });

  // testWidgets('TodoList adds and removes items', (WidgetTester tester) async {
  //   await tester.pumpWidget(MaterialApp(home: DashboardPage()));

  //   // Verify if the correct UI elements are displayed
  //   expect(find.byType(Dismissible), findsNothing); // No items initially

  //   // Add an item
  //   await tester.enterText(find.byType(TextField), 'Task 1');
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify if the item is added
  //   expect(find.byType(ListTile), findsOneWidget);
  //   expect(find.text('Task 1'), findsOneWidget);

  //   // Dismiss the item
  //   await tester.drag(find.byType(Dismissible), Offset(500.0, 0.0));
  //   await tester.pumpAndSettle();
  //   expect(find.byType(ListTile), findsNothing);
  // });
}
