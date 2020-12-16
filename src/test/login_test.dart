import 'package:ESOF/screens/login.dart';
import 'package:ESOF/screens/utils/LabelSI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart' as FlutterTest;
import 'package:test/test.dart';
import 'package:flutter/material.dart';

void main() {
  FlutterTest.testWidgets('Should find the lock icon on password field',
      (FlutterTest.WidgetTester tester) async {
    final lockIcon = Icons.lock;
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));
    expect(FlutterTest.find.byIcon(lockIcon), FlutterTest.findsOneWidget);
  });

  FlutterTest.testWidgets('Should find email string several times',
      (FlutterTest.WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));
    expect(FlutterTest.find.text("Email"), FlutterTest.findsWidgets);
  });

  FlutterTest.testWidgets('Shouldn\'t find a ListView Widget',
      (FlutterTest.WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));
    expect(FlutterTest.find.byType(ListView), FlutterTest.findsNothing);
  });
}
