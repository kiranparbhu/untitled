import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:untitled/utils/base_state.dart';
import 'package:webview_flutter/webview_flutter.dart';



class InspectionDashboard extends StatefulWidget {
  const InspectionDashboard({Key? key}) : super(key: key);

  @override
  State<InspectionDashboard> createState() => _InspectionDashboardState();
}

class _InspectionDashboardState extends BaseState<InspectionDashboard> {
  WebViewController? _controller;
  InAppWebViewController? _webViewController;
  String url = "";
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          child: Column(children: <Widget>[
          Expanded(
          child: Container(
              child: InAppWebView(
              initialUrlRequest:URLRequest(url: Uri.parse("https://col.devitsandbox.com/minspection/index?EmpUserID=CLKRAJ1")),
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                  mediaPlaybackRequiresUserGesture: false,
                 // debuggingEnabled: true,
                ),
              ),
              onWebViewCreated: (InAppWebViewController controller) {
                _webViewController = controller;
              },
              androidOnPermissionRequest: (InAppWebViewController controller, String origin, List<String> resources) async {
                return PermissionRequestResponse(resources: resources, action: PermissionRequestResponseAction.GRANT);
              }
          ),
        ),
    ),
    ])));
  }


}