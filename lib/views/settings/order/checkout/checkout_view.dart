import 'package:flutter/material.dart';
import 'package:plate_perks/utils/static/routes.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CheckoutView extends StatefulWidget {
  final String url;

  const CheckoutView({super.key, required this.url});

  @override
  CheckoutViewState createState() => CheckoutViewState();
}

class CheckoutViewState extends State<CheckoutView> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();


    late PlatformWebViewControllerCreationParams params = const PlatformWebViewControllerCreationParams();
    final WebViewController controller =
    WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            // debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            // debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
                Page resource error:
                  code: ${error.errorCode}
                  description: ${error.description}
                  errorType: ${error.errorType}
                  isForMainFrame: ${error.isForMainFrame}
                          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },

          onUrlChange: (UrlChange change) {
            if (change.url!.contains("success")) {
              debugPrint('Success URL: ${change.url}');
              debugPrint('Success URL length: ${change.url!.length}');
              Navigator.of(context).pushReplacementNamed(
                  AppRoutes.checkoutSuccess);
            } else if (change.url!.contains("failed")) {
              Navigator.of(context).pushReplacementNamed(
                  AppRoutes.checkoutFailed);
            } else {
              debugPrint('Current URL length: ${change.url!.length}');
            }
          },
          // debugPrint('Success Payment method --> ${change.url}');
          onHttpAuthRequest: (HttpAuthRequest request) {
            // openDialog(request);
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse(widget.url));

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: WebViewWidget(controller: _controller)),
    );
  }

}