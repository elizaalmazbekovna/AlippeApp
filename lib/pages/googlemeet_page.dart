import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'dart:io' show Platform;

class GoogleMeetPage extends StatefulWidget {
  final String link;

  GoogleMeetPage({required this.link});

  @override
  _GoogleMeetPageState createState() => _GoogleMeetPageState();
}

class _GoogleMeetPageState extends State<GoogleMeetPage> {
  late final WebViewController _controller;

  // @override
  // void initState() {
  //   super.initState();
  //   if (Platform.isAndroid) {
  //     WebView.platform = SurfaceAndroidWebView();
  //     } else if (Platform.isIOS || Platform.isMacOS) {
  //        WebView.platform = WebKitWebViewPlatform();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Meet'),
        backgroundColor: Colors.grey[700],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      // body: WebView(
      //   initialUrl: widget.link,
      //   javascriptMode: JavascriptMode.unrestricted,
      //   onWebViewCreated: (WebViewController webViewController) {
      //     _controller = webViewController;
      //   },
    );
  }
}
