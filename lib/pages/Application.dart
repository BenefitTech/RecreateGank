import 'package:flutter/material.dart';
import 'package:recreate_gank/common/GlobalConfig.dart';
import 'classify/ClassifyPage.dart';
import 'home/HomePage.dart';
import 'mine/MinePage.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  int _currentPage = 0;
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

    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        backgroundColor: Colors.purple,
      ),
      body: PageView(
        controller: _pageController,
        // onPageChanged: _onPageChanged,
        children: <Widget>[HomePage(), ClassifyPage(), MinePage()],
        physics: NeverScrollableScrollPhysics(), // 这句话表示不能拖动换页面
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomTabItems,
        currentIndex: _currentPage,
        type: BottomNavigationBarType.fixed,
        onTap: _onTapTabBarItem,
      ),
    );
  }

  void _onTapTabBarItem(int index) {
    _currentPage = index;
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);

    setState(() {
      switch (index) {
        case 0:
          _title = GlobalConfig.homeTab;
          break;
        case 1:
          _title = GlobalConfig.classyTab;
          break;
        case 2:
          _title = GlobalConfig.mineTab;
          break;

        default:
      }
    });
  }
}
