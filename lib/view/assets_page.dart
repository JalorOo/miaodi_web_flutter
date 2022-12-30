import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miaodi_web/common/constant.dart';
import 'package:miaodi_web/common/style.dart';
import 'package:miaodi_web/data/assets_history.dart';
import 'package:miaodi_web/data/user.dart';
import 'package:miaodi_web/generated/l10n.dart';
import 'package:miaodi_web/utils/string_utils.dart';
import 'package:miaodi_web/utils/ui_utils.dart';
import 'package:miaodi_web/viewModel/account_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

import 'transfer_assets_page.dart';

/// 喵点的查看界面
class AssetsPage extends StatefulWidget {
  const AssetsPage({Key? key}) : super(key: key);

  @override
  State<AssetsPage> createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> {
  User? _user;
  AccountViewModel _accountViewModel = AccountViewModel.getInstance();

  late Future<List<AssetsHistory>> _getHistory;

  @override
  void initState() {
    _getHistory = _accountViewModel.getAssetsHistory();
    _getUser();
    // 获取用户信息
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: UiUtils.isDarkMode(context)
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        foregroundColor:
            UiUtils.isDarkMode(context) ? Colors.white : Colors.black,
        title: Text(S.of(context).myMBit),
        // 完成了再开放
        actions: [
          IconButton(
              onPressed: () {
                chooseSpendManner();
              },
              icon: Icon(Icons.more_vert)),
        ],
      ),
      body: _body(),
    );
  }

  /// 身体部分
  /// 返回头部
  /// 喵点明细
  /// 以及具体信息
  Widget _body() {
    return FutureBuilder<List<AssetsHistory>>(
        future: _getHistory,
        initialData: null,
        builder:
            (BuildContext context, AsyncSnapshot<List<AssetsHistory>> history) {
          List<Widget> l = [
            _assetsCard(_user == null ? 0 : _user!.assets),
            _title(S.of(context).mBitDetail),
          ];
          if (history.hasData) {
            for (AssetsHistory value in history.data!) {
              l.add(_infoItem(value));
            }
          }
          l.add(Center(
              child: Text(
            S.of(context).noMoreData,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          )));
          return ListView(
            children: l,
          );
        });
  }

  /// 喵点卡片
  Widget _assetsCard(int count) {
    return Container(
      height: 200,
      width: double.infinity,
      margin: EdgeInsets.only(left: 16, right: 16, top: 32),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: UiUtils.isDarkMode(context) ? Color(0xff6D6D6D) : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.grey.withAlpha(100),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: 24, child: Image.asset("images/money.png")),
              SizedBox(
                width: 8,
              ),
              Text(S.of(context).restOfAssets),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            getFormatMoney(count),
            style: TextStyle(
                color: secondColor, fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Expanded(child: SizedBox()),
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Container(
                padding: EdgeInsets.all(8),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).assetsTips,
                      style: TextStyle(fontSize: 14,color: Colors.black54),
                    ),
                    Expanded(child: SizedBox()),
                    GestureDetector(
                      onTap: () {
                        launch("${Constant.web}/mbit.html");
                      },
                      child: Container(
                        height: 28,
                        padding: EdgeInsets.only(left: 16, right: 16),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Text(
                          S.of(context).goToLearn,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }

  /// 标题
  Widget _title(String s) {
    return Container(
      margin: EdgeInsets.only(left: 16, top: 16),
      child: Row(
        children: [
          Text(
            s,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    );
  }

  /// 详细信息
  Widget _infoItem(AssetsHistory assetsHistory) {
    return ListTile(
      title: Text(assetsHistory.info!),
      subtitle: Text(assetsHistory.time!),
      trailing: Text(assetsHistory.effect! > 0
          ? "+${assetsHistory.effect!}"
          : "${assetsHistory.effect!}"),
    );
  }

  Future<void> _getUser() async {
    _user = await User.getInstance();
    setState(() {});
  }

  /// 选择喵点的花费方式
  chooseSpendManner() {
    return showModalBottomSheet(
        isScrollControlled: false, //内容是否可滚动
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
              height: 192,
              decoration: BoxDecoration(
                color: UiUtils.isDarkMode(context)? Colors.black:Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25)),
              ),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      margin: EdgeInsets.only(top: 16, bottom: 16),
                      width: 50,
                      height: 8,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      oneSpendManner(
                          "images/transfer.png",
                          Colors.amber,
                          S.of(context).assetsTransfer,
                          TransferAssetsPage()),
                      // oneSpendManner(
                      //     "images/purchase.png",
                      //     Colors.lightBlueAccent,
                      //     S.of(context).buyVIP,
                      //     PayPage()),
                    ],
                  ),
                ],
              ));
        });
  }

  /// 喵点花费的方式
  Widget oneSpendManner(
      String iconAssets, Color color, String text, Widget page) {
    return InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 72,
            child: Image.asset(
              iconAssets,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return page;
        }));
      },
    );
  }
}
