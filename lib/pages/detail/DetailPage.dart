import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:recreate_gank/api/API.dart';
import 'package:recreate_gank/api/HTTP.dart';
import 'package:recreate_gank/common/Constant.dart';
import 'package:recreate_gank/model/DailyResponse.dart';
import 'package:recreate_gank/utils/IndicatorUtils.dart';
import 'package:recreate_gank/utils/SharedUtils.dart';
import 'DetailListView.dart';
import 'package:recreate_gank/pages/components/LittleWidget.dart';

class DetailPage extends StatefulWidget {
  String feedType;
  bool showTitle = false;

  DetailPage({Key key, this.feedType, this.showTitle}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with HTTP, IndicatorFactory {
  List listData;
  var currentPage = 1;
  var listTotalSize = 0;
  var requestError = false;

  RefreshController refreshController;

  void enterRefresh() {
    refreshController.requestRefresh(true);
  }

  @override
  void initState() {
    super.initState();

    refreshController = RefreshController();

    loadingData();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildContent(BuildContext context) {
      if (requestError) {
        return buildExceptionIndicator('网络请求出错了！');
      }

      if (listData == null) {
        return Center(child: CupertinoActivityIndicator());
      }

      return SmartRefresher(
        enablePullUp: true,
        enablePullDown: true,
        controller: refreshController,
        headerBuilder: buildDefaultHeader,
        footerBuilder: buildDefaultFooter,
        footerConfig: RefreshConfig(),
        onRefresh: (up) {
          if (up) {
            pullToRefresh();
          } else {
            loadingMore();
          }
        },
      );
    }

    if (widget.showTitle) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.feedType),
        ),
        body: buildContent(context),
      );
    } else {
      return Scaffold(
        body: buildContent(context),
      );
    }
  }

  // 网络请求
  getNewList(bool isLoadMore) async {
    String url = getURL();
    await getGankFromNet(url).then((CategoryResponse category) {
      if (!category.error) {
        var listData = category.results;
        if (listData.length > 0) {
          setState(() {
            if (!isLoadMore) {
              this.listData = listData;
              SharedUtils.saveString(url, json.encode(category.toString()));
            } else {
              List list = List();
              list.addAll(this.listData);
              list.addAll(listData);
              this.listData = list;
            }
          });
        }
      }

      if (isLoadMore) {
        refreshController.sendBack(false, RefreshStatus.idle);
      } else {
        refreshController.sendBack(true, RefreshStatus.completed);
      }

      return false;
    }).catchError((error) {
      refreshController.sendBack(true, RefreshStatus.failed);
      return false;
    });
  }

  // 下拉刷新
  Future pullToRefresh() async {
    currentPage = 1;
    await getNewList(false);
    return null;
  }

  // 加载更多
  void loadingMore() {
    currentPage++;
    getNewList(true);
  }

  // 加载初始数据
  void loadingData() async {
    String url = getURL();
    var cacheData = await SharedUtils.get(url);
    if (cacheData != null) {
      var userMap = json.decode(cacheData);
      CategoryResponse categoryResponse = CategoryResponse.fromJson(userMap);
      print('获取缓存数据成功');
      setState(() {
        listData = categoryResponse.results;
      });
    }

    if (listData == null) {
      print('缓存为空时，请求数据');
      getNewList(false);
    }
  }

  String getURL() {
    var url = API.feed;
    url += widget.feedType + '/10/' + this.currentPage.toString();
    print('feedListURL:$url');
    return url;
  }
}
