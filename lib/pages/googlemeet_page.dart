import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GoogleMeetPage extends StatelessWidget {
  final String link;

  GoogleMeetPage({required this.link});

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
      body: WebView(
        initialUrl: 'https://meet.google.com/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
