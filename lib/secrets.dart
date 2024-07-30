import 'dart:io' show Platform;

class Secret {
  static const ANDROID_CLIENT_ID = "AIzaSyAv6YkYvb-RLvaEdk5Y6gRgxPU65pcsgas";
  static const IOS_CLIENT_ID = "AIzaSyAhQUEc-3eezD5P_BpFDDHSLUBEJJfROWQ";
  static String getId() =>
      Platform.isAndroid ? Secret.ANDROID_CLIENT_ID : Secret.IOS_CLIENT_ID;
}
