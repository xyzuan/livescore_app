import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:livescore/screen/auth/auth_screen.dart';

void main() {
 testWidgets('Test Auth Page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AuthPage()));
    expect(find.byType(AuthPage), findsOneWidget);
    expect(find.text('Discover all about sport'), findsOneWidget);
    expect(find.text('Sign Up'), findsOneWidget);
    expect(find.text('Sign in'), findsOneWidget);
    expect(find.text('Search millions of jobs and get the inside scoop on companies Wait for what? Lets get start it!'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
 });
}