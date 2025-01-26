import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/functions/custom_app_bar.dart';
import '../../../../core/routes/app_routes.dart';

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
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://pay.chargily.dz/')) {
              return NavigationDecision.navigate;
            } else {
              context.go(AppRoutes.kHomeView);

              return NavigationDecision.prevent;
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Chargily Payment Page"),
      body: WebViewWidget(controller: webViewController),
    );
  }
}

// ('https://67816e09de31b761be3d.appwrite.global/)'

// import 'package:flutter/cupertino.dart';
// import 'package:url_launcher/link.dart';

// import '../../../../core/widgets/custom_button.dart';

// class CheckoutView extends StatelessWidget {
//   final String url;

//   const CheckoutView({super.key, required this.url});

//   @override
//   Widget build(BuildContext context) {
//     return Link(
//       uri: Uri.parse(url),
//       builder: (BuildContext context, FollowLink? followLink) => CustomButton(
//         text: 'followLink',
//         onPressed: () => followLink,
//       ),
//     );
//   }
// }
