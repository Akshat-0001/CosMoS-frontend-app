import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ConstellationsWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Constellations'),
      ),
      body: WebView(
        initialUrl: 'https://www.cosm0s.tech', // Replace with your actual URL
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
