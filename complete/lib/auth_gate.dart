import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'main.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});
  //驗證使用者是否能登入我們的系統  是->進入系統  否->在登入頁面登入你的密碼
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),  //判斷你現在狀態 是否能登入系統
      builder: (context, snapshot) {
        if (!snapshot.hasData) { //如果不能登入系統or一開始 -> 跳轉登入密碼頁面
          return SignInScreen(//定義登入頁面細部內容
            providers: [
              EmailAuthProvider(),
              GoogleProvider(clientId: clientId),
            ],
            headerBuilder: (context, constraints, shrinkOffset) { //定義 登入頁面的標題
              return Padding( //header內為一張圖片放在assets/flutterfire_300x.png
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset('assets/flutterfire_300x.png'),
                ),
              );
            },
            subtitleBuilder: (context, action) { //定義中間內容  
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: action == AuthAction.signIn //判斷當前頁面是登入還是註冊 並進行畫面的跳轉
                    ? const Text('Welcome to FlutterFire, please sign in!')
                    : const Text('Welcome to Flutterfire, please sign up!'),
              );
            },
            footerBuilder: (context, action) { //定義最底下的畫面 有 TEXT
              return const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'By signing in, you agree to our terms and conditions.',
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
          );
        }

        return const HomeScreen();
      },
    );
  }
}
