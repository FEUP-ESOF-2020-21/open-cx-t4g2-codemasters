import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class TapWidget extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String key) async {
    await world.driver.waitFor(find.byValueKey('Bottom Bar'));
    await world.driver.tap(find.byValueKey('Profile'));
    print('left');
  }

  @override
  RegExp get pattern => RegExp(r"I tap {string}");
}

class Appears extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String key) async {
    print('Hello');
    final bioInput = find.byValueKey(key);
    var exists = await FlutterDriverUtils.isPresent(world.driver, bioInput);
    expectMatch(true, exists);
  }

  @override
  RegExp get pattern => RegExp(r"I can see my {string}");
}
