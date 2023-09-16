import 'package:flutter/material.dart';

class ServerTextWidget extends StatefulWidget {
  const ServerTextWidget({super.key});

  @override
  State<ServerTextWidget> createState() => _ServerTextWidgetState();
}

class _ServerTextWidgetState extends State<ServerTextWidget> {
  String? data;

  void serverCall() async {
    if (data == null) {
      await Future.delayed(const Duration(seconds: 2));
      data = 'test';

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    serverCall();

    return Text(data ?? 'No Data');
  }
}
