import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miaodi_web/view/cloud/passage_version_page.dart';

import '../../common/style.dart';
import '../../data/page_backup.dart';
import '../../utils/ui_utils.dart';
import '../../viewModel/passage_backup_view_model.dart';
import 'component/history_list_view.dart';

class CloudHistoryPage extends StatefulWidget {
  final id;

  const CloudHistoryPage({Key? key, this.id}) : super(key: key);

  @override
  _CloudHistoryPageState createState() => _CloudHistoryPageState();
}

class _CloudHistoryPageState extends State<CloudHistoryPage>
    with TickerProviderStateMixin {
  PassageBackupViewModel _passageViewModel =
      PassageBackupViewModel.getInstance();
  AnimationController? animationController;

  //初始化滚动监听器，加载更多使用
  final ScrollController _controller = new ScrollController();
  bool _loading = false;

  @override
  void initState() {
    _passageViewModel.queryHistoryPassages(widget.id, refresh: true);

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
        elevation: 0,
        backgroundColor:
        UiUtils.isDarkMode(context) ? darkItemColor : lightItemColor,
        iconTheme: IconThemeData(
            color: UiUtils.isDarkMode(context) ? Colors.white : Colors.black),
        title: Text(
          "文章历史版本",
        ),
        actions: [
          Visibility(
            visible: _loading,
            child: Container(
              margin: EdgeInsets.only(right:contentMargin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 24, width: 24, child: CircularProgressIndicator()),
                ],
              ),
            ),
          ),
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
            child: StreamBuilder<List<PageBackUp>>(
                initialData: [], //初始的数据
                stream: _passageViewModel.cloudPassageStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return const SizedBox(
                      child: Text("空空如也！"),
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
                          child: HistoryListView(
                            animation: animation,
                            animationController: animationController,
                            passage: snapshot.data![index],
                            callBack: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return PassageVersionPage(
                                    id: snapshot.data![index].id,
                                    title: snapshot.data![index].title,
                                    content: snapshot.data![index].content,
                                    time: snapshot.data![index].updateTime);
                              }));
                            },
                          ),
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
    await _passageViewModel.queryHistoryPassages(widget.id, refresh: true);
  }

  /// 底部上拉加载更多
  _onLoadMore() {
    setState(() {
      _loading = true;
    });
    _passageViewModel.queryHistoryPassages(widget.id);
    setState(() {
      _loading = false;
    });
  }
}

enum selectMenu {
  fastDelete,
}
