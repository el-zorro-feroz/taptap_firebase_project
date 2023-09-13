import 'package:flutter/material.dart';

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
      home: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            strokeAlign: 1.0,
          ),
        ),
      ),
    );
  }
}
