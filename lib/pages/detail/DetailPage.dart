import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:recreate_gank/api/API.dart';
import 'package:recreate_gank/api/HTTP.dart';
import 'package:recreate_gank/common/Constant.dart';
import 'package:recreate_gank/model/DailyResponse.dart';
import 'package:recreate_gank/utils/IndicatorUtils.dart';
import 'package:recreate_gank/utils/SharedUtils.dart';
import 'DetailListView.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
