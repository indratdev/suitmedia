import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:suitmedia/utils/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebsitePage extends StatefulWidget {
  const WebsitePage({Key? key}) : super(key: key);

  @override
  State<WebsitePage> createState() => _WebsitePageState();
}

class _WebsitePageState extends State<WebsitePage> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    WebViewController _controller;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Constants.greenColor),
        backgroundColor: Colors.white,
        title: Text(
          "Website",
          style: TextStyle(color: Constants.greenColor),
        ),
      ),
      body: Center(
        child: WebView(
          initialUrl: 'https://suitmedia.com/',
          key: UniqueKey(),
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
          },
        ),
      ),
    );
  }
}
