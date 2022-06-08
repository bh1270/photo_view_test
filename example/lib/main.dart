import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:digiwhale_photo_view/digiwhale_photo_view.dart';
import 'package:photo_preview/photo_preview_export.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await DigiwhalePhotoView.platformVersion ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Builder(
        builder: (context) => Scaffold(
          body: InkWell(
            child: Center(
              child: Text(_platformVersion),
            ),
            onTap: () {
              PhotoPreviewPage.navigatorPush(
                  context,
                  PhotoPreviewDataSource(imgVideoFullList: [
                    PhotoPreviewInfoVo(
                        url: "https://s1.ax1x.com/2020/09/17/wR3WnI.jpg",
                        loadingCoverUrl:
                            "https://s1.ax1x.com/2020/09/17/wR3WnI.md.jpg",
                        type: PhotoPreviewType.image),
                    PhotoPreviewInfoVo(
                        url: "https://v-cdn.zjol.com.cn/277001.mp4",
                        loadingCoverUrl:
                            "https://s1.ax1x.com/2020/09/17/wR8uCD.jpg",
                        type: PhotoPreviewType.video),
                    PhotoPreviewInfoVo(
                        url: "https://s1.ax1x.com/2020/09/17/wR0NmF.jpg",
                        loadingCoverUrl:
                            "https://s1.ax1x.com/2020/09/17/wR0NmF.md.jpg",
                        type: PhotoPreviewType.image),
                    PhotoPreviewInfoVo(
                        url: "https://s1.ax1x.com/2020/09/17/wR3H3Q.jpg",
                        loadingCoverUrl:
                            "https://s1.ax1x.com/2020/09/17/wR3H3Q.md.jpg",
                        type: PhotoPreviewType.image)
                  ]));
            },
          ),
        ),
      ),
    );
  }
}
