import 'package:flutter/material.dart';

import 'auth_gate.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) { //定義Build Widget 進行建構
    return MaterialApp(  //定義  MaterialApp 會對我們頁面的其他page進行渲染
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), //此處會把我們之後的其他widget染成紫色
        useMaterial3: true,
      ),
      home: const AuthGate(), //定義homepage 為 AutoGate() ->放在AutoGate.dart
    );
  }
}
