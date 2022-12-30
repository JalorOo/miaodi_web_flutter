import 'package:flutter/material.dart';
import 'package:miaodi_web/utils/ui_utils.dart';

class SettingsItem extends StatefulWidget {

  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final GestureTapCallback? onTap;

  SettingsItem({Key? key, this.leading, this.title, this.subtitle, this.trailing, this.onTap}) : super(key: key);

  @override
  _SettingsItemState createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
      decoration: BoxDecoration(
        color: UiUtils.isDarkMode(context)?Colors.black:Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16))
      ),
      child: ListTile(
        leading: widget.leading,
        title: widget.title,
        subtitle: widget.subtitle,
        trailing: widget.trailing,
        onTap: widget.onTap,
      ),
    );
  }
}
