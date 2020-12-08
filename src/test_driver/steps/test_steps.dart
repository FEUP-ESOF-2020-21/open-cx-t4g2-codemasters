import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class TapWidget extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String key) async {
    final widget = find.byValueKey(key);
    await FlutterDriverUtils.tap(world.driver, widget);
  }
  @override
  RegExp get pattern => RegExp(r"I tap {string}");
}

class WriteText extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String text) async {
    // Write Question
    final questionField = find.byValueKey("questionField");
    await FlutterDriverUtils.tap(world.driver, questionField);
    await world.driver.enterText(question);
  }
  @override
  RegExp get pattern => RegExp(r"When I write the question {string}");
}