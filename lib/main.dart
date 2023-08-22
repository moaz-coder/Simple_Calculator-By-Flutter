import 'package:flutter/material.dart';

import 'CaculatorScreen/CaculatorScreen.dart';

void main() {
  runApp(CaculatorApp());
}

class CaculatorApp extends StatelessWidget {
  const CaculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {CaculatorScreen.routeName: (buildContext) => CaculatorScreen()},
      initialRoute: CaculatorScreen.routeName,
    );
  }
}
