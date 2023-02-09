import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebMan extends StatefulWidget {
  const WebMan({Key? key}) : super(key: key);

  @override
  State<WebMan> createState() => _WebManState();
}

class _WebManState extends State<WebMan> {
  // Completer<WebViewController> _controller = Completer<WebViewController>();
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://linktr.ee/mantenatal')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://linktr.ee/mantenatal'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:WebViewWidget(controller: controller),
      // WebView(
      //   initialUrl: 'https://linktr.ee/mantenatal',
      //   onWebViewCreated: (WebViewController webViewController) {
      //     _controller.complete(webViewController);
      //   },
      // ),
    );

  }
}
