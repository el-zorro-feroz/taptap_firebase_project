import 'package:flutter/material.dart';
import 'package:taptapfirebase/src/presentation/controller/server_text_controller.dart';

class StlTestPage extends StatelessWidget {
  final ServerTextController serverTextController1;
  final ServerTextController serverTextController2;

  const StlTestPage({
    super.key,
    required this.serverTextController1,
    required this.serverTextController2,
  });

  @override
  Widget build(BuildContext context) {
    void onServerPressed() async {
      serverTextController1.getServerText();
      await Future.delayed(const Duration(seconds: 2));
      serverTextController2.getServerText();
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedBuilder(
                animation: serverTextController1,
                builder: (_, __) {
                  return Text(serverTextController1.serverText);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedBuilder(
                animation: serverTextController2,
                builder: (_, __) {
                  return Text(serverTextController2.serverText);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: onServerPressed,
                child: const Text(
                  'Get Server',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
