import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:taptapfirebase/src/presentation/pages/test_color_page.dart';

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
      home: const TestColorPage(),
    );
  }
}
