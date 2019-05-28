import 'package:recreate_gank/pages/other/detail/DetailPage.dart';
import 'package:flutter/material.dart';

class ClassifyTabPage {
  ClassifyTabPage({this.icon, this.text, this.detailPage});

  final IconData icon;
  final String text;
  final DetailPage detailPage;
}

List<ClassifyTabPage> loadClassifyTabs() {
  List<ClassifyTabPage> allPages = <ClassifyTabPage>[
    ClassifyTabPage(
        text: 'all',
        detailPage: DetailPage(
          feedType: 'all',
          showTitle: false,
        )),
    ClassifyTabPage(
        text: '福利',
        detailPage: DetailPage(
          feedType: '福利',
          showTitle: false,
        )),
    ClassifyTabPage(
        text: 'Android',
        detailPage: DetailPage(
          feedType: 'Android',
          showTitle: false,
        )),
    ClassifyTabPage(
        text: 'iOS',
        detailPage: DetailPage(
          feedType: 'iOS',
          showTitle: false,
        )),
    ClassifyTabPage(
        text: '前端',
        detailPage: DetailPage(
          feedType: '前端',
          showTitle: false,
        )),
    ClassifyTabPage(
        text: '拓展资源',
        detailPage: DetailPage(
          feedType: '拓展资源',
          showTitle: false,
        )),
    ClassifyTabPage(
        text: '瞎推荐',
        detailPage: DetailPage(
          feedType: '瞎推荐',
          showTitle: false,
        )),
    ClassifyTabPage(
        text: 'App',
        detailPage: DetailPage(
          feedType: 'App',
          showTitle: false,
        )),
    ClassifyTabPage(
        text: '休息视频',
        detailPage: DetailPage(
          feedType: '休息视频',
          showTitle: false,
        )),
  ];

  return allPages;
}
