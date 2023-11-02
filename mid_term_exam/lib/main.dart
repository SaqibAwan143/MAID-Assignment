import 'ui/background/background.dart';
import 'ui/forms/login_page.dart';
import 'package:flutter/material.dart';

// Saqib Shehzad
// 2021-CS-187
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Stack(
          children: [
            Background(),
            const LoginForm(),
          ],
        ),
      ),
    );
  }
}
