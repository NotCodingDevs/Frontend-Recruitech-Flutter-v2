import 'package:flutter/material.dart';
import 'package:frontend_recruitech_flutter_v2/security/ui/login/login_view.dart';
import 'package:frontend_recruitech_flutter_v2/security/ui/register/register_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const LoginView(),
    );
  }
}
