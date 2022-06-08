import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:digiwhale_photo_view/digiwhale_photo_view.dart';

void main() {
  const MethodChannel channel = MethodChannel('digiwhale_photo_view');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await DigiwhalePhotoView.platformVersion, '42');
  });
}
