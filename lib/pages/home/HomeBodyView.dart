import 'package:recreate_gank/model/DailyResponse.dart';
import 'HomeBuildRows.dart';
import 'package:recreate_gank/pages/components/LittleWidget.dart';

import 'package:flutter/material.dart';

import 'dart:convert';

Widget buildHomeDailyView(BuildContext context, Object homeData) {
  if (homeData == null) {
    return buildLoadingIndicator();
  }

  Map<String, dynamic> value = jsonDecode(homeData);
  DailyResponse response = DailyResponse.fromJson(value);
  List contents = List();
  List banners = List();
  List titles = List();

  if (response.error) {
    return buildExceptionIndicator('网络请求错误');
  }

  if (response.category.length == 0) {
    return buildExceptionIndicator('这里空空如也o(╯□╰)o');
  }

  response.category.forEach((row) {
    if (row == '福利') {
      titles.insert(0, row);
    } else {
      titles.add(row);
    }
  });

  titles.forEach((title) {
    if (title == '福利') {
      banners.add(response.results[title]);
    } else {
      contents.addAll(response.results[title]);
    }
  });

  contents.insert(0, banners);

  print('首页banner $banners');

  print('首页内容$contents');

  return _buildListViewBuilder(context, contents);
}

Widget _buildListViewBuilder(BuildContext context, List data) {
  return ListView.builder(
    physics: AlwaysScrollableScrollPhysics(),
    padding: EdgeInsets.all(2.0),
    itemCount: data == null ? 0 : data.length,
    itemBuilder: (context, i) {
      if (i == 0) {
        return homeBuildRows(data[i]);
      } else {
        return buildRow(context, data[i]);
      }
    },
  );
}
