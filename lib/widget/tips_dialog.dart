import 'package:flutter/material.dart';
import 'package:miaodi_web/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class TipsDialog {
  static show(BuildContext context, String title, tips) async {
    await showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text(title),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[Text(tips)],
            ),
          ),
          actions: <Widget>[
            new TextButton(
              child: new Text(S.of(context).ok),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static showPrivacyAndUserAgreement(BuildContext context, String title, tips,
      userAgreement, privacy, userUrl, privacyUrl, Function agree) async {
    await showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text(title),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                Text(tips),
                GestureDetector(
                  child: Text(
                    userAgreement,
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                  onTap: () {
                    launch(userUrl);
                  },
                ),
                GestureDetector(
                  child: Text(
                    privacy,
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                  onTap: () {
                    launch(privacyUrl);
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                S.of(context).cancel,
              ),
            ),
            TextButton(
              onPressed: () {
                agree();
              },
              child: Text(S.of(context).grant,
                  style: TextStyle(
                    color: Colors.amber,
                  )),
            ),
          ],
        );
      },
    );
  }

  static wait(BuildContext context, String title, tips) async {
    await showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text(title),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[Text(tips)],
            ),
          ),
        );
      },
    );
  }

  static showByChoose(
      BuildContext context, String title, tips, yes, no, Function f) async {
    await showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text(title),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[Text(tips)],
            ),
          ),
          actions: <Widget>[
            new TextButton(
              child: new Text(no),
              onPressed: () {
                f(false);
              },
            ),
            new TextButton(
              child: new Text(yes),
              onPressed: () {
                f(true);
              },
            ),
          ],
        );
      },
    );
  }

  static toast(BuildContext context, String tips) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(tips)));
  }
}
