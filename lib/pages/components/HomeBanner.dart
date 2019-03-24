import 'package:recreate_gank/model/DailyResponse.dart';

import 'package:recreate_gank/utils/PageRouteUtils.dart';
import 'PhotoView.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeBanner extends StatefulWidget {
  final double homeBannerHeight;
  final List<PostData> topList;
  HomeBanner(this.topList, this.homeBannerHeight);

  @override
  _HomeBannerState createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
