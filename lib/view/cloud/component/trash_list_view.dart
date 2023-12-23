import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miaodi_web/data/cloud_passage.dart';

import '../../../common/style.dart';
import '../../../utils/ui_utils.dart';
import '../../../widget/tips_dialog.dart';

class TrashListView extends StatefulWidget {
  const TrashListView(
      {Key? key,
      required this.passage,
      this.recover,
      this.delete,
      this.animationController,
      this.animation})
      : super(key: key);

  final CloudPassage passage;
  final VoidCallback? recover;
  final VoidCallback? delete;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  State<StatefulWidget> createState() {
    return _TrashListViewState();
  }
}

class _TrashListViewState extends State<TrashListView> {

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.animationController!,
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
            //FadeTransition实现透明度渐变动画
            opacity: widget.animation!,
            child: Transform(
              transform: Matrix4.translationValues(
                  0.0, 50 * (1.0 - widget.animation!.value), 0.0),
              child: GestureDetector(
                onTap: () {},
                child: Card(
                  //z轴的高度，设置card的阴影
                  elevation: 0.0,
                  //设置shape，这里设置成了R角
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  //对Widget截取的行为，比如这里 Clip.antiAlias 指抗锯齿
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    height: widget.passage.type == 0? 150: 120,
                    color: UiUtils.isDarkMode(context)? darkItemColor: lightItemColor,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16, top: 8, bottom: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if(widget.passage.type == 0)Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              widget.passage.title!,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          if(widget.passage.type == 0)Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(widget.passage.content!,
                                  maxLines: 3, style: TextStyle(fontSize: 16)),
                            ),
                          ),
                          if(widget.passage.type == 1)ListTile(
                            leading: Icon(
                              Icons.folder,
                              color: Colors.green
                            ),
                            title: Text(
                                widget.passage.title!),
                            subtitle: Text(
                              widget.passage.updateTime!,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          Row(
                            children: [
                              if(widget.passage.type == 0)Text(widget.passage.updateTime!,
                                  style: TextStyle(fontSize: 12)),
                              Expanded(child: Container()),
                              Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: GestureDetector(
                                    onTap: () async {
                                      await TipsDialog.showByChoose(
                                          context,
                                          "提示",
                                          "即将把文章恢复到原书本与章节",
                                          "确认",
                                          "取消", (value) {
                                        if (value) {
                                          widget.recover!();
                                        }
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: Container(
                                      width: 45,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                      child: Center(
                                        child: Icon(
                                          Icons.undo,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: GestureDetector(
                                    onTap: () async {
                                      await TipsDialog.showByChoose(
                                          context,
                                          "提示",
                                          "即将把文章永久删除，且该操作不可逆",
                                          "确认",
                                          "取消", (value) {
                                            print(value);
                                        if (value) {
                                          widget.delete!();
                                        }
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: Container(
                                      width: 45,
                                      height: 25,
                                      decoration: const BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                      child: const Center(
                                        child: Icon(
                                          Icons.delete_forever,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
