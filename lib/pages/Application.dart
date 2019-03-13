import 'package:flutter/material.dart';
import 'package:recreate_gank/common/GlobalConfig.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  int _page = 0;
  String _title = GlobalConfig.homeTab;

  PageController _pageController;

  // 定义TabItem
  final List<BottomNavigationBarItem> _bottomTabItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text(GlobalConfig.homeTab),
        backgroundColor: GlobalConfig.colorPrimary),
    BottomNavigationBarItem(
        icon: Icon(Icons.tune),
        title: Text(GlobalConfig.classyTab),
        backgroundColor: GlobalConfig.colorPrimary),
    BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text(GlobalConfig.mineTab),
        backgroundColor: GlobalConfig.colorPrimary),
  ];

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: _page);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
