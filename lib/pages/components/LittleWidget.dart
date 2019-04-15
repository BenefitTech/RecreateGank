import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:recreate_gank/model/DailyResponse.dart';
import 'WelfareBuildRows.dart';
import 'DetailList.dart';

Widget buildRow(BuildContext context, Map one) {
  PostData postData = PostData.fromJson(one);
  if (postData.type == '福利') {
    return buildWelfareRows(context, postData);
  } else {
    return buildDetailListRow(context, postData);
  }
}

// 苹果格式的菊花转
Widget buildLoadingIndicator() {
  return Center(
    child: CupertinoActivityIndicator(),
  );
}

// 异常显示
Widget buildExceptionIndicator(String message) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Align(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Image.asset(
              'images/empty_data.png',
              width: 50.0,
              height: 50.0,
              color: Colors.grey,
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                message,
                style: TextStyle(color: Colors.grey),
              ),
            )
          ],
        ),
      )
    ],
  );
}
