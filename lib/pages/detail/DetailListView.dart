import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:recreate_gank/common/Constant.dart';
import 'package:recreate_gank/model/DailyResponse.dart';
import 'package:recreate_gank/pages/components/LittleWidget.dart';
import 'package:recreate_gank/pages/history/HistoryList.dart';
import 'package:recreate_gank/pages/history/HistoryTitle.dart';
import 'package:recreate_gank/pages/components/PhotoView.dart';
import 'package:recreate_gank/utils/PageRouteUtils.dart';

import 'package:cached_network_image/cached_network_image.dart';

Widget buildCategoryListView(BuildContext context, AsyncSnapshot snapshot) {
  CategoryResponse categoryResponse = CategoryResponse.fromJson(snapshot.data);
  List results = categoryResponse.results;

  if (categoryResponse.error) {
    return buildExceptionIndicator("网络请求错误");
  } else {
    if (categoryResponse.results.length == 0) {
      return buildExceptionIndicator("这里空空如也。。。");
    } else {
      return _buildListViewBuilder(context, results);
    }
  }
}

Widget _buildListViewBuilder(BuildContext context, List results) {
  switch (results.length) {
    case 1:
      return Center(
        child: Card(
          elevation: 16,
          child: Text("暂无数据"),
        ),
      );

    default:
      return ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(2.0),
        itemCount: results == null ? 0 : results.length,
        itemBuilder: (context, i) {
          return buildRow(context, results[i]);
        },
      );
  }
}
