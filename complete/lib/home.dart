import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( //定義HomeScreen基本排版  
      appBar: AppBar( //定義畫面最上面橫幅 有按鈕
        actions: [
          IconButton( //有按鈕
            icon: const Icon(Icons.person),
            onPressed: () {//定義按鈕若我們按下去進行知操作
              Navigator.push(
                context,
                MaterialPageRoute<ProfileScreen>( //按下按鈕跳轉至ProfileScreen 以下定義ProfileScreen畫面
                  builder: (context) => ProfileScreen(
                    appBar: AppBar( //ProfileScreen畫面上方有橫幅TEXT文字:User Profile
                      title: const Text('User Profile'),
                    ),
                    actions: [ //ProfileScreen下方signout按鈕按下去後會進行登出
                      SignedOutAction((context) {
                        Navigator.of(context).pop();
                      })
                    ],
                    children: [ // //ProfileScreen畫面插入一張圖片
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset('flutterfire_300x.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Center(//定義主畫面
        child: Column( //column從上至下排列widgets : dash.png 、 Welcome text 、 signoutbutton
          children: [
            Image.asset('dash.png'),
            Text(
              'Welcome!',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SignOutButton(),
          ],
        ),
      ),
    );
  }
}
