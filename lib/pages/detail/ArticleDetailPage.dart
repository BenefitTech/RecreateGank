import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class ArticleDetailPage extends StatefulWidget {
  String title, url;
  ArticleDetailPage({Key key, @required this.title, @required this.url})
      : super(key: key);

  @override
  _ArticleDetailPageState createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  bool isLoading = true;
  final webViewPlugin = FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();

    webViewPlugin.onStateChanged.listen((state) {
      debugPrint('state_' + state.type.toString());

      if (state.type == WebViewState.finishLoad) {
        setState(() {
          isLoading = false;
        });
      } else if (state.type == WebViewState.startLoad) {
        setState(() {
          isLoading = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.url,
      appBar: AppBar(
        title: Text(widget.title),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: isLoading
              ? LinearProgressIndicator(
                  backgroundColor: Color(0xFFE57373),
                  valueColor: AlwaysStoppedAnimation(Color(0xFFD32F2F)),
                )
              : Divider(
                  height: 1.0,
                  color: Theme.of(context).primaryColor,
                ),
        ),
      ),
      withZoom: false,
      withJavascript: true,
      withLocalStorage: true,
    );
  }
}
