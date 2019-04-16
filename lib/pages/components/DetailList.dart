import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:recreate_gank/utils/TimeUtils.dart';
import 'package:recreate_gank/model/DailyResponse.dart';
import 'package:recreate_gank/utils/PageRouteUtils.dart';
import 'package:recreate_gank/common/GlobalConfig.dart';
import 'package:recreate_gank/pages/components/WebViewPage.dart';

Widget buildDetailListRow(BuildContext context, PostData postData) {
  return InkWell(
    onTap: () {
      fastRoutePageWidgetBuilder(context, WebViewPage(post: postData.toJson()));
    },
    child: Card(
      margin: EdgeInsets.all(2.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            _createTimeRow(postData: postData),
            Container(
              margin: EdgeInsets.fromLTRB(2.0, 4.0, 2.0, 14.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  postData.desc,
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ),
            ),
            _createAuthorAndSource(postData: postData)
          ],
        ),
      ),
    ),
  );
}

// 作者 及来源
Widget _createTimeRow({PostData postData}) {
  return Row(children: <Widget>[
    Container(
      margin: EdgeInsets.fromLTRB(2.0, 4.0, 2.0, 4.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Icon(
          Icons.access_time,
          size: 12.0,
          color: GlobalConfig.colorPrimary,
        ),
      ),
    ),
    Text(
      formatDate(dateString: postData.publishedAt.toString()),
      style: TextStyle(fontSize: 12.0, color: Colors.grey),
    ),
    Expanded(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          getTimestampString(DateTime.parse(postData.publishedAt)),
          style: TextStyle(fontSize: 12.0, color: Colors.grey),
        ),
      ),
    ),
  ]);
}

Widget _createAuthorAndSource({PostData postData}) {
  return Row(children: <Widget>[
    Text(
      '作者：',
      style: TextStyle(fontSize: 12.0, color: Colors.grey),
    ),
    Text(
      postData.who.toString(),
      style: TextStyle(
        fontSize: 12.0,
        color: GlobalConfig.colorPrimary,
      ),
    ),
    Expanded(
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          postData.source.toString(),
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.grey,
          ),
        ),
      ),
    )
  ]);
}
