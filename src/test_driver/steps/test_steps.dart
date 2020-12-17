import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class TapWidget extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String key) async {
    String email = 'codemasters@esof.pt';
    String password = '1234567';

    final emailInputField = find.byValueKey("Email");
    final passwordInputField = find.byValueKey("Password");
    final submitButton = find.byValueKey("submitBtn");

    await FlutterDriverUtils.tap(world.driver, emailInputField);
    await world.driver.enterText(email);
    await FlutterDriverUtils.tap(world.driver, passwordInputField);
    await world.driver.enterText(password);
    await FlutterDriverUtils.tap(world.driver, submitButton);
    await world.driver.waitFor(find.byValueKey('Bottom Bar'));
    await world.driver.tap(find.byTooltip(key));
  }

  @override
  RegExp get pattern => RegExp(r"the {string} screen");
}

class TapButton1 extends When1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String key) async {
    final editProfileBtn = find.byValueKey(key);
    await FlutterDriverUtils.tap(world.driver, editProfileBtn);
  }

  @override
  RegExp get pattern => RegExp(r"I tap {string}");
}

class TapButton2 extends AndWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    await world.driver
        .scroll(find.byValueKey('List'), 1.0, -500.0, Duration(seconds: 1));
    final editProfileBtn = find.byValueKey('submitBtn');
    print(editProfileBtn);
    await FlutterDriverUtils.tap(world.driver, editProfileBtn);
  }

  @override
  RegExp get pattern => RegExp(r"I submit");
}

class WriteNewBio extends And2WithWorld<String, String, FlutterWorld> {
  @override
  Future<void> executeStep(String key1, String key2) async {
    final bioInput = find.byValueKey(key2);
    await FlutterDriverUtils.tap(world.driver, bioInput);
    await world.driver.enterText(key1);
  }

  @override
  RegExp get pattern => RegExp(r"I write {string} in {string}");
}

class Appears extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String message) async {
    await world.driver.waitFor(find.byValueKey('Bottom Bar'));
    await world.driver.tap(find.byTooltip('Profile'));
    final bioInput = find.byValueKey('Name');
    var exists = await FlutterDriverUtils.isPresent(world.driver, bioInput);
    expectMatch(true, exists);
  }

  @override
  RegExp get pattern => RegExp(r"I can see {string}");
}
