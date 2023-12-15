import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/my_app_theme.dart';
import './home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyAppTheme(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<MyAppTheme>(context).currentTheme,
      home: const MyHomePage(),
    );
  }
}
