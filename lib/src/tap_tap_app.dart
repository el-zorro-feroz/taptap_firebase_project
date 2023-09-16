import 'package:flutter/material.dart';
import 'package:taptapfirebase/src/presentation/controller/server_text_controller.dart';
import 'package:taptapfirebase/src/presentation/page/stl_test_page.dart';

class TapTapApp extends StatelessWidget {
  const TapTapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
        ),
      ),
      home: StlTestPage(
        serverTextController1: ServerTextController(),
        serverTextController2: ServerTextController(),
      ),
    );
  }
}
