
import 'package:digiwhale_photo_view_example/common_with_bottom_status_style/delegate/common_with_bottom_status_slide_delegate.dart';
import 'package:digiwhale_photo_view_example/common_with_bottom_status_style/delegate/common_with_bottom_status_video_delegate.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_preview/photo_preview_export.dart';

class CommonWithBottomStatusStylePage {
  static void navigatorPush(BuildContext context, int initialPage,
      List<PhotoPreviewInfoVo> imageList) {
    PhotoPreviewPage.navigatorPush(
      context,
      PhotoPreviewDataSource(
          initialPage: initialPage, imgVideoFullList: imageList),
      extendedSlideDelegate: CommonWithBottomStatusSlideDelegate(
          imgVideoCount: imageList.length, imageViewList: imageList),
      videoDelegate: CommonWithBottomStatusVideoDelegate(),
    );
  }
}
