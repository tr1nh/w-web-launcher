import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:w_web_launcher/screens/drawer/drawer_screen.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class WebViewContainer extends StatefulWidget {
  final String url;

  const WebViewContainer({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  WebViewContainerState createState() => WebViewContainerState();
}

class WebViewContainerState extends State<WebViewContainer> {
  late WebViewPlusController webViewController;

  @override
  Widget build(BuildContext context) {
    return WebViewPlus(
        initialUrl: 'assets/pages/index.html',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewPlusController controller) {
          webViewController = controller;
          webViewController.loadUrl(widget.url);
        },
        javascriptChannels: Set.from([
          JavascriptChannel(
              name: 'openApp',
              onMessageReceived: (JavascriptMessage message) {
                DeviceApps.openApp(message.message);
              }),
          JavascriptChannel(
              name: 'openDrawer',
              onMessageReceived: (JavascriptMessage message) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DrawerScreen()));
              })
        ]));
  }

  void reloadUrl(String url) {
    webViewController.loadUrl(url);
  }
}
