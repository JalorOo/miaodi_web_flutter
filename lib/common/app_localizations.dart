import 'package:flutter/material.dart';

/// 备用，万一[generated/l10n.dart]挂了，就把这个类命名成S
class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    "en": {
      "protection": "Protection of Account",
      "pinInput": "Please input your PIN",
      "help": "How to use",
      "tips":"Tips",
      "pinError":"PIN error",
      "record": "Record",
      "todo": "Todo",
      "cloud": "Cloud",
      "settings": "Settings",
      "about": "About",
      "loginOrRegister": "Login/Register",
      "hello": "Hello :)",
      "appName": "Miaodi",
      "appDescription": "Markdown Record Software",
      "login": "Login",
      "email":"Email",
      "username":"Username",
      "password":"Password",
      "userInput":"Input username or password please",
      "loggingIn":"Logging in",
      "emailLogin":"Use email to login",
      "forgetPassword":"Forget password?",
      "register":"Register",
      "meansAgree":"meant agree",
      "userAgreement":"UserAgreement",
      "privacy":"Privacy",
      "successfully":" successfully",
      "unsuccessfully":" unsuccessfully",
      "errorHappened":" error happened: ",
      "wait":" please wait a second",
      "safety":"Safety",
      "pinLock":"PIN Lock",
      "data":"Data",
      "import":"Import",
      "export":"Export",
      "feedback":"Feedback",
      "propose":"Propose & Feedback",
    },
    "zh": {
      "protection": "账号保护",
      "pinInput": "请输入密码",
      "help":"使用帮助",
      "tips":"提示",
      "pinError":"6位密码错误",
      "record":"记录",
      "todo": "Todo",
      "cloud": "云服务",
      "settings": "设置",
      "about": "关于",
      "loginOrRegister": "登录/注册",
      "hello": "你好鸭:)",
      "appName": "喵滴",
      "appDescription": "Markdown记录软件",
      "login": "登录",
      "email":"邮箱名",
      "username":"用户名",
      "password":"密码",
      "userInput":"请输入用户名或密码",
      "loggingIn":"登录中",
      "emailLogin": "使用邮箱名登录",
      "forgetPassword": "忘记密码？",
      "register": "注册",
      "meansAgree":"代表同意",
      "userAgreement":"《用户协议》",
      "privacy":"《隐私政策》",
      "successfully":"成功",
      "unsuccessfully":"失败",
      "errorHappened":"原因：",
      "safety":"安全",
      "pinLock":"PIN解锁",
      "data":"数据",
      "import":"导入文件",
      "export":"导出所有数据",
      "feedback":"反馈",
      "propose":"建议 & 问题反馈",
    }
  };

  String get safety {
    return _localizedValues[locale.languageCode]!["safety"]!;
  }

  String get pinLock {
    return _localizedValues[locale.languageCode]!["pinLock"]!;
  }

  String get data {
    return _localizedValues[locale.languageCode]!["data"]!;
  }

  String get import {
    return _localizedValues[locale.languageCode]!["import"]!;
  }

  String get export {
    return _localizedValues[locale.languageCode]!["export"]!;
  }

  String get feedback {
    return _localizedValues[locale.languageCode]!["feedback"]!;
  }

  String get propose {
    return _localizedValues[locale.languageCode]!["propose"]!;
  }

  String get wait {
    return _localizedValues[locale.languageCode]!["wait"]!;
  }

  String get errorHappened {
    return _localizedValues[locale.languageCode]!["errorHappened"]!;
  }

  String get unsuccessfully {
    return _localizedValues[locale.languageCode]!["unsuccessfully"]!;
  }

  String get successfully {
    return _localizedValues[locale.languageCode]!["successfully"]!;
  }

  String get privacy {
    return _localizedValues[locale.languageCode]!["privacy"]!;
  }

  String get userAgreement {
    return _localizedValues[locale.languageCode]!["userAgreement"]!;
  }

  String get meansAgree {
    return _localizedValues[locale.languageCode]!["meansAgree"]!;
  }

  String get register {
    return _localizedValues[locale.languageCode]!["register"]!;
  }

  String get forgetPassword {
    return _localizedValues[locale.languageCode]!["forgetPassword"]!;
  }

  String get emailLogin {
    return _localizedValues[locale.languageCode]!["emailLogin"]!;
  }

  String get loggingIn {
    return _localizedValues[locale.languageCode]!["loggingIn"]!;
  }

  String get userInput {
    return _localizedValues[locale.languageCode]!["userInput"]!;
  }

  String get password {
    return _localizedValues[locale.languageCode]!["password"]!;
  }

  String get username {
    return _localizedValues[locale.languageCode]!["username"]!;
  }

  String get email {
    return _localizedValues[locale.languageCode]!["email"]!;
  }

  String get login {
    return _localizedValues[locale.languageCode]!["login"]!;
  }

  String get appDescription {
    return _localizedValues[locale.languageCode]!["appDescription"]!;
  }

  String get appName {
    return _localizedValues[locale.languageCode]!["appName"]!;
  }

  String get hello {
    return _localizedValues[locale.languageCode]!["hello"]!;
  }

  String get protection {
    return _localizedValues[locale.languageCode]!["protection"]!;
  }

  String get pinInput {
    return _localizedValues[locale.languageCode]!["pinInput"]!;
  }

  String get help {
    return _localizedValues[locale.languageCode]!["help"]!;
  }

  String get tips {
    return _localizedValues[locale.languageCode]!["tips"]!;
  }

  String get pinError {
    return _localizedValues[locale.languageCode]!["pinError"]!;
  }

  String get record {
    return _localizedValues[locale.languageCode]!["record"]!;
  }

  String get todo {
    return _localizedValues[locale.languageCode]!["todo"]!;
  }

  String get cloud {
    return _localizedValues[locale.languageCode]!["cloud"]!;
  }

  String get settings {
    return _localizedValues[locale.languageCode]!["settings"]!;
  }

  String get about {
    return _localizedValues[locale.languageCode]!["about"]!;
  }

  String get loginOrRegister {
    return _localizedValues[locale.languageCode]!["loginOrRegister"]!;
  }
}
