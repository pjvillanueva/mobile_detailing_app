import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class AppWebView extends StatefulWidget {
  const AppWebView({super.key, required this.title, required this.url});

  final String title;
  final String url;

  @override
  State<AppWebView> createState() => _AppWebViewState();
}

class _AppWebViewState extends State<AppWebView> {
  double _progress = 0;
  // ignore: unused_field
  late InAppWebViewController _inAppWebViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              const Text('Back to App', style: TextStyle(color: Colors.white)),
          backgroundColor: const Color(0xFF001F3F),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => Navigator.pop(context)),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: SafeArea(
          child: Stack(
            children: [
              InAppWebView(
                  initialUrlRequest: URLRequest(url: WebUri(widget.url)),
                  onWebViewCreated: (controller) {
                    _inAppWebViewController = controller;
                  },
                  onProgressChanged:
                      (InAppWebViewController controller, int progress) {
                    setState(() {
                      _progress = progress / 100;
                    });
                  }),
              _progress < 1
                  ? LinearProgressIndicator(value: _progress)
                  : Container()
            ],
          ),
        ));
  }
}
