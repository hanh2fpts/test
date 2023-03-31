import 'package:flutter/services.dart';

class ToastPlatform {
  static const platform = MethodChannel('samples.flutter.dev/toastMessage');

  Future<void> toastMessage() async {
    try {
      await platform.invokeMethod('toastMessage');
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
}
