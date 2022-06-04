import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:io';

class WebsitePage extends StatefulWidget {
  const WebsitePage({Key? key}) : super(key: key);

  @override
  State<WebsitePage> createState() => _WebsitePageState();
}

class _WebsitePageState extends State<WebsitePage> {
  final GlobalKey webviewkey = GlobalKey();
  final TextEditingController textEditingController = TextEditingController();

  late PullToRefreshController pullToRefreshController;
  InAppWebViewController? webViewController;

  double progress = 0;

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Browser"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                hintText: "Search Webpage",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          progress < 1.0
              ? LinearProgressIndicator(value: progress)
              : Container(),
          Expanded(
            flex: 9,
            child: InAppWebView(
              key: webviewkey,
              pullToRefreshController: pullToRefreshController,
              initialUrlRequest: URLRequest(url: Uri.parse(args)),
              initialOptions: options,
              onWebViewCreated: (controller) {
                webViewController = controller;
              },
              onLoadStart: (controller, url) {
                setState(() {
                  textEditingController.text = args.toString();
                });
              },
              onLoadStop: (controller, url) async {
                pullToRefreshController.endRefreshing();
                setState(() {
                  textEditingController.text = args;
                });
              },
              androidOnPermissionRequest:
                  (controller, origin, resources) async {
                return PermissionRequestResponse(
                    resources: resources,
                    action: PermissionRequestResponseAction.GRANT);
              },
              onProgressChanged: (controller, val) {
                if (val == 100) {
                  pullToRefreshController.endRefreshing();
                }
                setState(() {
                  progress = val / 100;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
