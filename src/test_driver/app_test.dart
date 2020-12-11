import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';

import 'steps/test_steps.dart';


Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"./test_driver/features/**.feature")]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './report.json')
    ]
    ..stepDefinitions = [
      Screen(),
      TapWidget(),
      Appears()]

    ..restartAppBetweenScenarios = true
    ..targetAppPath = "./test_driver/app.dart"
    ..exitAfterTestRun = true; // set to false if debugging to exit cleanly
  return GherkinRunner().execute(config);
}