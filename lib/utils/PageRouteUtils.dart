import 'package:flutter/material.dart';
import 'package:recreate_gank/pages/detail/ArticleDetailPage.dart';

fastRoutePageBuilder(BuildContext context, String title) {}

fastRouteWebPageBuilder(BuildContext context, String title, String url) {
  Navigator.of(context).push(PageRouteBuilder(
      opaque: false,
      pageBuilder: (context, _, __) {
        return ArticleDetailPage(title: title, url: url);
      },
      transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: FadeTransition(
            opacity: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
            child: child,
          ),
        );
      }));
}

fastRoutePageWidgetBuilder(BuildContext context, Widget widget) {
  Navigator.of(context).push(PageRouteBuilder(
      opaque: false,
      pageBuilder: (context, _, __) {
        return widget;
      },
      transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: FadeTransition(
            opacity: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
            child: child,
          ),
        );
      }));
}
