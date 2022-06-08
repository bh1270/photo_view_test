
import 'dart:async';

import 'package:flutter/services.dart';

class DigiwhalePhotoView {
  static const MethodChannel _channel = MethodChannel('digiwhale_photo_view');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
