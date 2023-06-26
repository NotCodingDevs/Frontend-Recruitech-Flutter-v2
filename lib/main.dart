import 'package:flutter/material.dart';
import 'package:frontend_recruitech_flutter_v2/recruitment/ui/main_view.dart';
import 'package:frontend_recruitech_flutter_v2/security/data/remote/models/user.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: MainView(
        currentUser: User(id: 1, username: '', email: '', jwtToken: ''),
      ),
    );
  }
}
