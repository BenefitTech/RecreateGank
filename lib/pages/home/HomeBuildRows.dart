import 'package:recreate_gank/model/DailyResponse.dart';
import 'package:recreate_gank/pages/components/HomeBanner.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget homeBuildRows(List postData) {
  List<PostData> banner = List();
  if (postData != null) {
    for (var value in postData[0]) {
      banner.add(PostData.fromJson(value));
    }
  }

  return HomeBanner(banner, 200.0);
}
