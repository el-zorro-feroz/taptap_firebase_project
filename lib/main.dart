import 'package:flutter/material.dart';
import 'package:taptapfirebase/core/injector/services.dart';
import 'package:taptapfirebase/src/tap_tap_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final InjectorService injectorService = InjectorService();
  await injectorService.init();

  runApp(const TapTapApp());
}
