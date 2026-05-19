import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class TorchController {
  static const platform = MethodChannel('custom_brightness');

  Future<void> setFullBrightness() async {
    try {
      await platform
          .invokeMethod('setFullBrightness'); // Calling native Kotlin code
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Failed to set brightness: '${e.message}'.");
      }
    }
  }

  Future<void> setLowBrightness() async {
    try {
      await platform
          .invokeMethod('setLowBrightness'); // Calling native Kotlin code
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Failed to set brightness: '${e.message}'.");
      }
    }
  }
}
