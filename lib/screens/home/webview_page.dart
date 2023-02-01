import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  final String Url;
  final String APP_BAR_NAME;
  late final WebViewController _controller;
  WebViewPage({required this.Url, required this.APP_BAR_NAME});

  @override
  Widget build(BuildContext context) {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            Url;
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(Url));
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: Text(
          APP_BAR_NAME,
          style: TextStyle(
            fontFamily: 'Monument Extended',
            color: Color(0xffFFFFFF),
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
