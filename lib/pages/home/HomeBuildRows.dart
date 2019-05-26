import 'package:recreate_gank/model/DailyResponse.dart';
import 'package:recreate_gank/pages/components/HomeBanner.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget homeBuildRows(postData) {
  List<PostData> banners = List();
  if (postData != null) {
    for (var value in postData[0]) {
      banners.add(PostData.fromJson(value));
    }
  }

  return HomeBanner(banners, 200.0);
}
