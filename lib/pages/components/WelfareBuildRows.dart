import 'package:recreate_gank/model/DailyResponse.dart';
import 'package:recreate_gank/utils/PageRouteUtils.dart';
import 'PhotoView.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Widget buildWelfareRows(BuildContext context, PostData postData) {
  final ThemeData theme = Theme.of(context);
  final TextStyle titleStyle =
      theme.textTheme.headline.copyWith(color: Colors.white);

  return InkWell(
    onTap: () => fastRoutePageWidgetBuilder(context, PhotoView(item: postData)),
    child: Card(
      margin: EdgeInsets.all(2.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: SizedBox(
          height: 300.0,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: CachedNetworkImage(
                  placeholder: CupertinoActivityIndicator(),
                  imageUrl: postData.url,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                bottom: 6.0,
                left: 6.0,
                right: 6.0,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    postData.desc,
                    style: titleStyle,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
