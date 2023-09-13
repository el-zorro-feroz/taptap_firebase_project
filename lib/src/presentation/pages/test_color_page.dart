import 'package:flutter/material.dart';
import 'package:taptapfirebase/src/presentation/controller/test_color_controller.dart';

class TestColorPage extends StatelessWidget {
  const TestColorPage({super.key});

  static const Color _enabledColor = Colors.green;
  static const Color _disabledColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    final TestColorController controller = TestColorController();

    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    void onTap() {
      controller.changeMechanismWorkState();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tap Tap',
        ),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (_, __) {
            return InkWell(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.0),
                  color: controller.isMechanismWork ? _enabledColor : _disabledColor,
                ),
                child: Text(
                  'Test Color Page',
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.surface,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
