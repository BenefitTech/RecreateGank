import 'package:flutter/material.dart';
import 'package:recreate_gank/api/API.dart';
import 'package:recreate_gank/common/Constant.dart';
import 'package:recreate_gank/api/HTTP.dart';
import 'package:recreate_gank/model/DailyResponse.dart';
import 'package:recreate_gank/utils/SharedUtils.dart';

import 'HomeBodyView.dart';

import 'dart:convert';

class HomePage extends StatefulWidget {
  final String dataDay;

  HomePage({Key key, this.dataDay}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HTTP {
  Object snapshot;
  var url = API.feed + '福利/5/1';

  Future<Null> _pullToRefresh() async {
    // 先从缓冲中取，再去网络请求
    requestHomeBanner(url);
  }

  @override
  void initState() {
    super.initState();

    ///请求首页item数据
    getHomeItemData();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: buildHomeDailyView(context, snapshot),
      onRefresh: _pullToRefresh,
    );
  }

  // 请求banner数据
  // void loadBannerData() async {
  //   print('feedListUrl: $url');

  //   // 先从缓存中获取获取banner图片数据
  //   var cacheData = await SharedUtils.get(url);
  //   if (cacheData != null) {
  //     var userMap = json.decode(cacheData);
  //     CategoryResponse category = CategoryResponse.fromJson(userMap);
  //     print("banner获取缓存数据成功");
  //   } else {
  //     print("banner网络请求数据成功");

  //     requestHomeBanner(url);
  //   }
  // }

  // 通过网络请求获取banner数据
  void requestHomeBanner(String url) {
    getGankFromNet(url).then((CategoryResponse category) {
      if (!category.error) {
        var listData = category.results;
        if (listData.length > 0) {
          // setState(() {
          //   //
          // });
          print(listData);
          // 只缓存第一页数据
          SharedUtils.saveString(url, json.encode(category));
        }
      }
    });
  }

  // 请求首页Item数据
  void getHomeItemData() {
    getCacheData(url: API.today).then((data) {
      setState(() {
        snapshot = data;
      });
    });
  }
}
