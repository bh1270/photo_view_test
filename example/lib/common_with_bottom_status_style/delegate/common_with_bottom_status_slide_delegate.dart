import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_preview/photo_preview_export.dart';

class CommonWithBottomStatusSlideDelegate extends DefaultExtendedSlideDelegate {
  final int? imgVideoCount;
  final List<PhotoPreviewInfoVo>? imageViewList;

  StreamController<int> pageChangeStatusStream = StreamController.broadcast();

  CommonWithBottomStatusSlideDelegate(
      {this.imgVideoCount = 0, this.imageViewList});

  @override
  Widget bottomWidget(bool? isSlideStatus) {
    if (imgVideoCount! <= 0) {
      return Container();
    }
    return AnimatedOpacity(
      opacity: isSlideStatus! ? 0 : 1,
      duration: Duration(milliseconds: 80),
      child: Container(
        height: 50,
        color: Colors.black.withOpacity(0.4),
        child: Center(
            child: StreamBuilder<int>(
                initialData: 0,
                stream: pageChangeStatusStream.stream,
                builder: (context, snapshot) {
                  return ListView.separated(
                      itemCount: imgVideoCount ?? 0,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(
                          left: 0, right: 0, top: 0, bottom: 0),
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimatedContainer(
                          width: (snapshot.data ?? 0) == index ? 16 : 4,
                          duration: Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 4,
                        );
                      });
                })),
      ),
    );
  }

  Widget topWidget(bool? isSlideStatus) {
    return StreamBuilder<int>(
        initialData: 0,
        stream: pageChangeStatusStream.stream,
        builder: (context, snapshot) {
          return Container(
            margin: EdgeInsets.only(top: 40),
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                ),
                Expanded(
                    child: Center(
                  child: Container(
                    // margin: EdgeInsets.only(top: 60),
                    // color: Colors.red,
                    child: Text(
                      '${(snapshot.data ?? 0) + 1}/${imgVideoCount}',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ),
                )),
                SizedBox(
                  width: 80,
                  child: TextButton(
                    child: Text('保存'),
                    onPressed: () {
                      print(
                          '点击保存了----${imageViewList![snapshot.data!].url}-----${snapshot.data}');
                    },
                  ),
                ),
              ],
            ),
            color: Colors.redAccent,
          );
        });
  }

  @override
  ValueChanged<int> get pageChangeStatus {
    return (int page) {
      if (page < 0 || page >= imgVideoCount!) {
        return;
      }
      pageChangeStatusStream.add(page);
    };
  }

  @override
  void dispose() {
    pageChangeStatusStream.close();
    super.dispose();
  }
}
