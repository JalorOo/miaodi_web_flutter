import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miaodi_web/common/style.dart';
import 'package:miaodi_web/data/callback.dart';
import 'package:miaodi_web/generated/l10n.dart';
import 'package:miaodi_web/utils/ui_utils.dart';
import 'package:miaodi_web/viewModel/account_view_model.dart';
import 'package:miaodi_web/widget/input_bottom_sheet.dart';
import 'package:miaodi_web/widget/tips_dialog.dart';

class TransferAssetsPage extends StatefulWidget {
  const TransferAssetsPage({Key? key}) : super(key: key);

  @override
  State<TransferAssetsPage> createState() => _TransferAssetsPageState();
}

class _TransferAssetsPageState extends State<TransferAssetsPage>
    with SingleTickerProviderStateMixin {
  TextEditingController usernameEditingController = new TextEditingController();
  TextEditingController countEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  AccountViewModel _accountViewModel = AccountViewModel.getInstance();
  FocusNode _assetsNode = FocusNode();

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _assetsNode.addListener(() {
      setState(() {});
      if (_assetsNode.hasFocus) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));
    _animation = CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutCirc);
    super.initState();
  }

  @override
  void dispose() {
    usernameEditingController.dispose();
    countEditingController.dispose();
    passwordEditingController.dispose();
    _assetsNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: UiUtils.isDarkMode(context)
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
      ),
      body: _body(),
    );
  }

  // 身体部分
  _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
        ),
        _textField(usernameEditingController, Icons.person_outline_outlined,
            S.of(context).whoToTransfer, false),
        Expanded(child: SizedBox()),
        // _textField(countEditingController,Icons.share_location,S.of(context).transferAssetsCount,false),
        // _textField(passwordEditingController,Icons.password_outlined,S.of(context).passwordConfirmed,true),
        _money(),
      ],
    );
  }

  /// 确认可以支付
  Widget sure() {
    return GestureDetector(
      onTap: () {
        if (usernameEditingController.text.isEmpty ||
            countEditingController.text.isEmpty) {
          return;
        }
        FocusNode _focus = FocusNode();
        InputBottomSheet.oneInput(
            context,
            passwordEditingController,
            _focus,
            S.of(context).passwordConfirmed,
            S.of(context).assetsTransferringTips, () async {
          Navigator.pop(context);
          TipsDialog.wait(
              context, S.of(context).tips, S.of(context).transferring);
          CallBack callback = await _accountViewModel.transferAssets(
              passwordEditingController.text,
              usernameEditingController.text,
              countEditingController.text);
          // 隐藏提示框
          Navigator.pop(context);
          // 打印转赠是否成功信息
          await TipsDialog.show(context, S.of(context).tips, callback.message);
          // 返回上一界面
          if (callback.success!) Navigator.pop(context);
        }, obscureText: true);
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) {
          return Container(
            width: MediaQuery.of(context).size.width / 3 +
                (MediaQuery.of(context).size.width / 3 * _animation.value) -
                18,
            height: 70 - 20 * _animation.value,
            margin:
                EdgeInsets.only(left: 10, right: 30 - 20 * _animation.value),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Text(
              S.of(context).sure,
              style: TextStyle(fontSize: 20),
            ),
          );
        },
      ),
    );
  }

  /// 转账信息填写
  _textField(TextEditingController controller, IconData icon, String text,
      bool cantObscureText) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: contentMargin, right: contentMargin),
      decoration: BoxDecoration(
        color:
            UiUtils.isDarkMode(context) ? Color(0xff505050) : Color(0xffe3e3e3),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      padding: const EdgeInsets.only(
          left: contentMargin,
          right: contentMargin,
          top: contentMargin / 2,
          bottom: contentMargin / 2),
      child: TextField(
        controller: controller,
        obscureText: cantObscureText, // 是否隐藏输入内容
        decoration: InputDecoration(
            border: InputBorder.none,
            // icon: Icon(icon),
            suffixIcon: IconButton(
              icon: Icon(Icons.close, size: 20),
              onPressed: () {
                controller.text = '';
              },
            ),
            hintText: text),
      ),
    );
  }

  Widget _money() {
    return Container(
      height: MediaQuery.of(context).size.height * 2 / 3,
      decoration: BoxDecoration(
        color: UiUtils.isDarkMode(context) ? Colors.black : Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(contentMargin * 2),
            child: Text(
              S.of(context).assetsTransfer,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                left: contentMargin * 2, right: contentMargin * 2),
            child: TextField(
              focusNode: _assetsNode,
              readOnly: true,
              showCursor: true,
              controller: countEditingController,
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: SizedBox(
                  width: 36,
                  child: Image.asset("images/money.png"),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.backspace_sharp, size: 20),
                  onPressed: () {
                    countEditingController.text = countEditingController.text
                        .substring(0, countEditingController.text.length - 1);
                    countEditingController.selection =
                        countEditingController.selection.copyWith(
                      baseOffset: countEditingController.text.length,
                      extentOffset: countEditingController.text.length,
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: contentMargin * 2, right: contentMargin * 2),
            child: Divider(),
          ),
          Expanded(child: SizedBox()),
          _keyBoardWidget(),
        ],
      ),
    );
  }

  /// 数字按钮
  Widget _numButton(var num) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          //默认不使用背景颜色
          return UiUtils.isDarkMode(context) ? Colors.black : Colors.white;
        }),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      ),
      child: Text(
        num,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      onPressed: () {
        countEditingController.text += "$num";
        countEditingController.selection =
            countEditingController.selection.copyWith(
          baseOffset: countEditingController.text.length,
          extentOffset: countEditingController.text.length,
        );
        //setState(() {});
      },
    );
  }

  /// 键盘
  _keyBoardWidget() {
    return Container(
      color: UiUtils.isDarkMode(context)
          ? _assetsNode.hasFocus
              ? Color(0xff505050)
              : Colors.black
          : _assetsNode.hasFocus
              ? Color(0xfffefefef)
              : Colors.white,
      child: Column(
        children: [
          FadeTransition(
            opacity: _animation,
            child: Container(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 10),
              child: MediaQuery.removePadding(
                removeTop: true,
                removeBottom: true,
                context: context,
                child: GridView(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: 50,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 2,
                  ),
                  children: <Widget>[
                    _numButton("1"),
                    _numButton("2"),
                    _numButton("3"),
                    _numButton("4"),
                    _numButton("5"),
                    _numButton("6"),
                    _numButton("7"),
                    _numButton("8"),
                    _numButton("9"),
                  ],
                ),
              ),
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 4),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width / 3 - 16,
                        height: 50,
                        child: FadeTransition(
                            opacity: _animation, child: _numButton("0"))),
                  ),
                ],
              ),
              //Expanded(child: sure()),
              Positioned(right: 0, bottom: 0, child: sure()),
            ],
          ),
          SizedBox(
            height: 46,
          ),
        ],
      ),
    );
  }
}
