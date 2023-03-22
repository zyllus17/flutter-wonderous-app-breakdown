import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:wonders/common_libs.dart';

class PlatformInfo {
  // Define a list of desktop platforms
  static const _desktopPlatforms = [TargetPlatform.macOS, TargetPlatform.windows, TargetPlatform.linux];
  // Define a list of mobile platforms
  static const _mobilePlatforms = [TargetPlatform.android, TargetPlatform.iOS];
  // Checks for current platform
  static bool get isDesktop => _desktopPlatforms.contains(defaultTargetPlatform) && !kIsWeb;
  static bool get isDesktopOrWeb => isDesktop || kIsWeb;
  static bool get isMobile => _mobilePlatforms.contains(defaultTargetPlatform) && !kIsWeb;
  // Define a static getter to get the pixel ratio of the device's screen
  static double get pixelRatio => WidgetsBinding.instance.window.devicePixelRatio;
  // Define static getters for each platform type
  static bool get isWindows => defaultTargetPlatform == TargetPlatform.windows;
  static bool get isLinux => defaultTargetPlatform == TargetPlatform.linux;
  static bool get isMacOS => defaultTargetPlatform == TargetPlatform.macOS;
  static bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;
  static bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;
  // Define a static getter to check if the device is connected to the internet
  static Future<bool> get isConnected async => await InternetConnectionChecker().hasConnection;
  // Define a static getter to check if the device is disconnected to the internet
  static Future<bool> get isDisconnected async => (await isConnected) == false;
}
