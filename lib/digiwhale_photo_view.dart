import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:photo_preview/photo_preview_export.dart';

class DigiwhalePhotoView {
  static const MethodChannel _channel = MethodChannel('digiwhale_photo_view');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  testPush(BuildContext context) {
    PhotoPreviewPage.navigatorPush(
        context,
        PhotoPreviewDataSource(imgVideoFullList: [
          PhotoPreviewInfoVo(
              url: "https://s1.ax1x.com/2020/09/17/wR3WnI.jpg",
              loadingCoverUrl: "https://s1.ax1x.com/2020/09/17/wR3WnI.md.jpg",
              type: PhotoPreviewType.image),
          PhotoPreviewInfoVo(
              url: "https://v-cdn.zjol.com.cn/277001.mp4",
              loadingCoverUrl: "https://s1.ax1x.com/2020/09/17/wR8uCD.jpg",
              type: PhotoPreviewType.video),
          PhotoPreviewInfoVo(
              url: "https://s1.ax1x.com/2020/09/17/wR0NmF.jpg",
              loadingCoverUrl: "https://s1.ax1x.com/2020/09/17/wR0NmF.md.jpg",
              type: PhotoPreviewType.image),
          PhotoPreviewInfoVo(
              url: "https://s1.ax1x.com/2020/09/17/wR3H3Q.jpg",
              loadingCoverUrl: "https://s1.ax1x.com/2020/09/17/wR3H3Q.md.jpg",
              type: PhotoPreviewType.image)
        ]));
  }
}
