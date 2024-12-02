import 'package:flutter/material.dart';
import 'package:checker/welcome.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.camera.request();
  runApp(const checker());
}

// ignore: camel_case_types
class checker extends StatelessWidget {
  const checker({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcomepage(),
    );
  }
}
