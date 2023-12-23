import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:miaodi_web/data/cloud_passage.dart';
import 'package:miaodi_web/generated/l10n.dart';
import 'package:miaodi_web/utils/ui_utils.dart';
import 'package:miaodi_web/widget/tips_dialog.dart';

import '../../../common/style.dart';

class CloudListView extends StatefulWidget {
  const CloudListView(
      {Key? key,
        this.passage,
        this.callBack,
        this.remove,
        this.animationController,
        this.animation})
      : super(key: key);

  final CloudPassage? passage;
  final VoidCallback? callBack,remove;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  State<StatefulWidget> createState() {
    return _CloudListViewState();
  }
}


class _CloudListViewState extends State<CloudListView>{
// PassageViewModel _passageViewModel=PassageViewModel.getInstance();
// BookViewModel _bookViewModel=BookViewModel.getInstance();
// ChapterViewModel _chapterViewModel=ChapterViewModel.getInstance();
//
//
// @override
//   void initState() {
//     _chapterViewModel.queryChapter("");
//     _bookViewModel.queryBook();
//     _passageViewModel.queryPassage();
//     super.initState();
//   }

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
                    color: UiUtils.isDarkMode(context)? darkItemColor: lightItemColor,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16, top: 8,bottom: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,//高度自适应
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
                                Expanded(child: Container()),
                                Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: GestureDetector(
                                      onTap: () async {
                                        await TipsDialog.showByChoose(
                                            context,
                                            S.of(context).tips,
                                            S.of(context).move2Trashbin,
                                            S.of(context).sure,
                                            S.of(context).cancel, (value) {
                                          print(value);
                                          if (value) {
                                            widget.remove!();
                                          }
                                          Navigator.pop(context);
                                        });
                                      },
                                      child: const Icon(
                                        Icons.delete_forever,
                                        color: Colors.red,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: Text(
                                widget.passage!.content!,
                                maxLines: 3,
                                style: TextStyle(fontSize: 16)
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Text(
                                widget.passage!.updateTime!,
                                style: TextStyle(fontSize: 12)
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 6,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 4,right: 4,top: 2,bottom: 2),
                                  decoration:BoxDecoration(
                                border: Border.all(
                                  color: UiUtils.isDarkMode(context)?Colors.white:Colors.black,
                                )
                            ),
                                  child: Text(
                                    "${widget.passage!.book!}/${widget.passage!.chara!}",
                                    style: TextStyle(
                                        color: UiUtils.isDarkMode(context)?Colors.white:Colors.black,
                                        fontSize:12
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 8,right:8),
                                  height: 25,
                                  decoration: BoxDecoration(
                                      color: widget.passage!.share == 0?Colors.green:Colors.blue,
                                      borderRadius: BorderRadius.all(Radius.circular(12))
                                  ),
                                  child: Center(
                                    child: Text(
                                      widget.passage!.share == 0? S.of(context).unshare:S.of(context).shared,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:12
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
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