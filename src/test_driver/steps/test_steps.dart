import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class TapWidget extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String key) async {
    final emailInputField = find.byValueKey("Email");
    final passwordInputField = find.byValueKey("Password");
    final submitButton = find.byValueKey("submitBtn");
    print('1');
    await FlutterDriverUtils.tap(world.driver, emailInputField);
    print('2');
    await world.driver.enterText('rui@hotmail.com');
    await FlutterDriverUtils.tap(world.driver, passwordInputField);
    await world.driver.enterText('123123123');
    await FlutterDriverUtils.tap(world.driver, submitButton);
    await world.driver.waitFor(find.byValueKey('Bottom Bar'));
    await world.driver.tap(find.byTooltip(key));
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
    print('S1');
    var exists = await FlutterDriverUtils.isPresent(world.driver, bioInput);
    print('S2');
    expectMatch(true, exists);
  }

  @override
  RegExp get pattern => RegExp(r"I can see my {string}");
}
