import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'firebase_options.dart';

// TODO(codelab user): Get API key
const clientId = 'YOUR_CLIENT_ID';

void main() async { //定義主程式的進行  首先進行Flutter的初始化 再進行 Firebase的初始化 再執行我們的APP 確保順序執行正確才不會產生BUG
  WidgetsFlutterBinding.ensureInitialized();//Flutter的初始化
  await Firebase.initializeApp(// Firebase的初始化
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //執行我們的APP
  runApp(const MyApp());
}
