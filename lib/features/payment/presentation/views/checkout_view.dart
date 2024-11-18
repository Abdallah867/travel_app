import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/functions/custom_app_bar.dart';

class CheckoutView extends StatefulWidget {
  final String url;

  const CheckoutView({super.key, required this.url});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late WebViewController webViewController;

  @override
  void initState() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        log('CheckoutView is being popped!');
        return true; // Allow the pop action to proceed.
      },
      child: Scaffold(
        appBar: customAppBar("Chargily Payment Page"),
        body: WebViewWidget(controller: webViewController),
      ),
    );
  }
}
