import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Discord_Scrren extends StatefulWidget {
  const Discord_Scrren({Key? key}) : super(key: key);

  @override
  State<Discord_Scrren> createState() => _Discord_ScrrenState();
}

class _Discord_ScrrenState extends State<Discord_Scrren> {
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
  if (request.url.startsWith('https://discord.com/invite/UXK8rUs3Tx')) {
  return NavigationDecision.prevent;
  }
  return NavigationDecision.navigate;
  },
  ),
  )
  ..loadRequest(Uri.parse('https://discord.com/invite/UXK8rUs3Tx'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:WebViewWidget(controller: controller),
      // WebView(
      //   initialUrl: 'https://discord.com/invite/UXK8rUs3Tx',
      //   javaScriptMode: JavaScriptMode.unrestricted,
      //   onWebViewCreated: (WebViewController webViewController) {
      //     _controller.complete(webViewController);
      //   },
      // ),
    );

  }
}
