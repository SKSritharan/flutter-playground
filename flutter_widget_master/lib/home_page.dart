import 'package:flutter/material.dart';

import './widgets/my_text_style.dart';
import './widgets/my_theme_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(
          'Widget Master',
          style: MyTextStyle.headlineSmall(),
        ),
        actions: [
          MyThemeButton(),
        ],
      ),
      body: Container(),
    );
  }
}
