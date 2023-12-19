import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:livescore/screen/auth/auth_screen.dart';

void main() {
  testWidgets('TodoList UI elements', (WidgetTester tester) async {
    await tester.pumpWidget(AuthPage());
    expect(find.text('Discover all about sport'), findsOneWidget);
    expect(find.byType(Text), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
