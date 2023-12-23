import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/style.dart';
import '../../../data/page_backup.dart';
import '../../../utils/ui_utils.dart';

class HistoryListView extends StatefulWidget {
  const HistoryListView(
      {Key? key,
        this.passage,
        this.callBack,
        this.remove,
        this.animationController,
        this.animation})
      : super(key: key);

  final PageBackUp? passage;
  final VoidCallback? callBack,remove;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  State<StatefulWidget> createState() {
    return _HistoryListViewState();
  }
}


class _HistoryListViewState extends State<HistoryListView>{

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
                onTap: widget.callBack,
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
                    height: 150,
                    color: UiUtils.isDarkMode(context)? darkItemColor: lightItemColor,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16, top: 8,bottom: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:4.0),
                            child: Row(
                              children: [
                                Text(
                                  widget.passage!.title!.length > 10?widget.passage!.title!.substring(0,10)+"...":widget.passage!.title!,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top:8.0),
                              child: Text(
                                  widget.passage!.content!,
                                  maxLines: 3,
                                  style: TextStyle(fontSize: 16)
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                  widget.passage!.updateTime!,
                                  style: TextStyle(fontSize: 12)
                              ),
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