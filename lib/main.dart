import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:miaodi_web/view/account_page.dart';
import 'package:miaodi_web/view/chat/chat_page.dart';
import 'package:miaodi_web/view/forget_password_page.dart';
import 'package:miaodi_web/view/register_page.dart';

import 'generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '喵滴',
      // 语言本地化
      localizationsDelegates: const [
        S.delegate,
        // AppLocalizationsDelegate.delegate,
        GlobalMaterialLocalizations.delegate, // 指定本地化的字符串和一些其他的值
        GlobalCupertinoLocalizations.delegate, // 对应的Cupertino风格
        GlobalWidgetsLocalizations.delegate // 指定默认的文本排列方向, 由左到右或由右到左
      ],
      // supportedLocales: [Locale("en"), Locale("zh")],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.amber,
      ),
      // initialRoute: '/',
      routes: {
        '/forgetPassword': (context) {
          print('register');
          return ForgetPasswordPage();
        },
        '/register': (context) {
          print('register');
          return RegisterPage();
        },
        '/chat': (context) {
          print('chat');
          return ChatPage();
        },
        '/': (context) {
          return AccountPage();
        }
      },
      // onGenerateInitialRoutes: (name) {
      //   // 设置参数初始化界面
      //   // 是数组，因为初始化页面可以是/a/b
      //   print('name: $name');
      //   if (name.startsWith('/?')) //若是login开头,，则是易班进行登录
      //     return [
      //       MaterialPageRoute(builder: (context) {
      //         return YiBanLoginPage();
      //       }),
      //     ];
      //   else //其他则是正常应用
      //     return [
      //       MaterialPageRoute(builder: (context) {
      //         return VipPage(username: 'a');
      //       }),
      //     ];
      // },
    );
  }
}
