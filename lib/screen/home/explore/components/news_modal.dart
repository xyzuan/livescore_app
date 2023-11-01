import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

Future<void> newsModal(BuildContext context, String image, String headline,
    String body, String externalLink) async {
  var webview = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..loadRequest(Uri.parse(externalLink));

  showCupertinoModalPopup(
    context: context,
    builder: (context) {
      return Container(
        height: 600,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28), topRight: Radius.circular(28)),
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28), topRight: Radius.circular(28)),
          child: WebViewWidget(
            controller: webview,
          ),
        ),
      );
    },
  );
}
