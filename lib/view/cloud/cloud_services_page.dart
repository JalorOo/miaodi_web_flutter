import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miaodi_web/common/style.dart';
import 'package:miaodi_web/data/cloud_passage.dart';
import 'package:miaodi_web/generated/l10n.dart';
import 'package:miaodi_web/view/cloud/cloud_passage_page.dart';
import 'package:miaodi_web/view/cloud/cloud_trash_page.dart';
import 'package:miaodi_web/utils/ui_utils.dart';
import 'package:miaodi_web/viewModel/passage_view_model.dart';
import 'package:miaodi_web/view/cloud/component/cloud_list_view.dart';

class CloudServicesPage extends StatefulWidget {
  const CloudServicesPage({Key? key}) : super(key: key);

  @override
  _CloudServicesPageState createState() => _CloudServicesPageState();
}

class _CloudServicesPageState extends State<CloudServicesPage>
    with TickerProviderStateMixin {
  PassageViewModel _passageViewModel = PassageViewModel.getInstance();
  AnimationController? animationController;

  //初始化滚动监听器，加载更多使用
  final ScrollController _controller = new ScrollController();
  bool _loading = false;

  @override
  void initState() {
    _passageViewModel.queryCloudPassages(refresh: true);

    // 用来监听用户是否滑动到了尾巴
    _controller.addListener(() {
      var maxScroll = _controller.position.maxScrollExtent;
      var pixel = _controller.position.pixels;
      if (maxScroll == pixel) {
        _onLoadMore();
      }
    });

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    super.initState();
  }

  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 一定要有AppBar 否则会显示不出来
    return Scaffold(
      backgroundColor: UiUtils.isDarkMode(context)? darkListBackgroundColor: listBackgroundColor,
      appBar: AppBar(
        title: Text(
          S.of(context).cloud,
        ),
        centerTitle: true,
        //居中标题
        elevation: 0,
        backgroundColor:
            UiUtils.isDarkMode(context) ? darkItemColor : lightItemColor,
        actions: [
          Visibility(
            visible: _loading,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 24, width: 24, child: CircularProgressIndicator()),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) {
                  return CloudTrashPage();
                }));
              },
              icon: Icon(Icons.delete_sweep_sharp)),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // appBar(),
          const SizedBox(
            height: 12,
          ),
          Expanded(
              child: RefreshIndicator(
            // 监听是否是下来刷新
            onRefresh: _onRefresh,
            child: StreamBuilder<List<CloudPassage>>(
                initialData: null, //初始的数据, 应该不写也行
                stream: _passageViewModel.cloudPassageStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              width:
                                  MediaQuery.of(context).size.width * 0.7 > 300
                                      ? 300
                                      : MediaQuery.of(context).size.width * 0.7,
                              child: SvgPicture.asset(
                                "images/loading.svg",
                              ),
                            ),
                            Text(S.of(context).loading)
                          ],
                        ),
                      ),
                    );
                  }
                  if (snapshot.data!.length == 0)
                    return Center(
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              width:
                                  MediaQuery.of(context).size.width * 0.7 > 300
                                      ? 300
                                      : MediaQuery.of(context).size.width * 0.7,
                              child: SvgPicture.asset(
                                "images/isEmpty.svg",
                              ),
                            ),
                            Text(S.of(context).noData)
                          ],
                        ),
                      ),
                    );
                  else
                    return ListView(
                      controller: _controller,
                      padding:
                          const EdgeInsets.only(top: 0, left: 12, right: 12),
                      physics: const BouncingScrollPhysics(),
                      //BouncingScrollPhysics 在列表结束时退回列表。 iOS 中有类似的效果。
                      scrollDirection: Axis.vertical,
                      children: List<Widget>.generate(snapshot.data!.length,
                          (int index) {
                        final int count = snapshot.data!.length;
                        final Animation<double> animation =
                            Tween<double>(begin: 0.0, end: 1.0)
                                .animate(CurvedAnimation(
                          parent: animationController!,
                          curve: Interval((1 / count) * index, 1.0,
                              curve: Curves.fastOutSlowIn),
                        ));
                        animationController?.forward();
                        return Container(
                          // 这里要加个Margin，不然每个item就上线首尾相连
                          margin: EdgeInsets.only(bottom: 16),
                          child: CloudListView(
                              animation: animation,
                              animationController: animationController,
                              passage: snapshot.data![index],
                              remove: () {
                                _passageViewModel
                                    .removeCloudPassage(snapshot.data![index]);
                              },
                              callBack: () {
                                Navigator.push(context,
                                    new MaterialPageRoute(builder: (context) {
                                  return CloudPassagePage(
                                      cloudPassage: snapshot.data![index]);
                                }));
                              }),
                        );
                      }),
                    );
                }),
          ))
        ],
      ),
    );
  }

  /// 顶部下拉刷新
  Future<void> _onRefresh() async {
    await _passageViewModel.queryCloudPassages(refresh: true);
  }

  /// 底部上拉加载更多
  _onLoadMore() async {
    setState(() {
      _loading = true;
    });
    await _passageViewModel.queryCloudPassages();
    setState(() {
      _loading = false;
    });
  }
}

enum selectMenu {
  fastDelete,
}
