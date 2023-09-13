import 'package:flutter/material.dart';

class TestColorPage extends StatefulWidget {
  final void Function() onTap;

  const TestColorPage({super.key, required this.onTap});

  @override
  State<TestColorPage> createState() => _TestColorPageState();
}

class _TestColorPageState extends State<TestColorPage> {
  bool isMechanismWork = false;

  Color getMechanismStateColor() {
    if (isMechanismWork) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    void onMechanismButtonTap() {
      setState(() {
        isMechanismWork = !isMechanismWork;
      });

      widget.onTap();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tap Tap',
        ),
      ),
      body: Center(
        child: InkWell(
          onTap: onMechanismButtonTap,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32.0),
              color: getMechanismStateColor(),
            ),
            child: Text(
              'Test Color Page',
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.background,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
