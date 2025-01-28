import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:segredo/controle/variavel.dart';
import 'package:segredo/firebase_options.dart';
import 'package:segredo/vis%C3%A3o/Home_page.dart';
import 'package:segredo/vis%C3%A3o/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
    create: (_) => AppState(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppState.instance,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: 'Login',
          routes: {
            'Login': (context) => LoginPage(),
            'HomePage': (context) => HomePage()
          },
        );
      },
    );
  }
}
