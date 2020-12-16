import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class Screen extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String key) async {
    final locator = find.byValueKey(key);
    var locatorExists = await FlutterDriverUtils.isPresent(world.driver, locator);
    expectMatch(true, locatorExists);
  }
  @override
  RegExp get pattern => RegExp(r"The {string} screen");
}


  class TapWidget extends When1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String key) async {
    final widget = find.byValueKey(key);
    await FlutterDriverUtils.tap(world.driver, widget);
  }
  @override
  RegExp get pattern => RegExp(r"I tap {string}");
}

class Appears extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String key) async {

    final widget = find.byValueKey(key);
    var exists = await FlutterDriverUtils.isPresent(world.driver, widget);
    expectMatch(true, exists);
  }
  @override
  RegExp get pattern => RegExp(r"{string} appears");
}