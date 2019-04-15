import 'package:recreate_gank/model/DailyResponse.dart';
import 'package:recreate_gank/utils/PageRouteUtils.dart';
import 'PhotoView.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class HomeBanner extends StatefulWidget {
  final double homeBannerHeight;
  final List<PostData> topList;
  HomeBanner(this.topList, this.homeBannerHeight);

  @override
  _HomeBannerState createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  static int fakeLength = 1000;

  int _currentPageIndex = 0;
  int _currentIndicatorIndex = 0;

  PageController _pageController = PageController(initialPage: fakeLength ~/ 2);

  List<Widget> _indicators = [];
  List<PostData> _fakeList = [];

  Duration _bannerDuration = Duration(seconds: 3);
  Duration _bannerAnimationDuration = Duration(microseconds: 500);

  Timer _timer;

  bool reverse = false;
  bool _isEndScroll = true;

  @override
  void initState() {
    super.initState();

    initTimer();
  }

  void dispose() {
    super.dispose();

    _timer.cancel();
  }

  // 通过实践timer做轮询，达到自动播放的 效果
  initTimer() {
    _timer = Timer.periodic(_bannerDuration, (timer) {
      if (_isEndScroll) {
        _pageController.animateToPage(_currentPageIndex + 1,
            duration: _bannerAnimationDuration, curve: Curves.linear);
      }
    });
  }

  // 用于做banner循环
  initFakeList() {
    for (var i = 0; i < fakeLength; i++) {
      _fakeList.addAll(widget.topList);
    }
  }

  initIndicators() {
    _indicators.clear();
    for (var i = 0; i < widget.topList.length; i++) {
      _indicators.add(SizedBox(
        width: 5.0,
        height: 5.0,
        child: Container(
          color: i == _currentIndicatorIndex ? Colors.white : Colors.grey,
        ),
      ));
    }
  }

  changePage(int page) {
    _currentPageIndex = page;
    _currentIndicatorIndex = page % widget.topList.length;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return buildBanner();
  }

  Widget buildBanner() {
    return Container(
      height: widget.homeBannerHeight,
      child: Stack(
        children: <Widget>[
          buildPageView(),
          buildIndicators(),
        ],
      ),
    );
  }

  Widget buildIndicators() {
    initIndicators();
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.black45,
        height: 20.0,
        child: Center(
          child: SizedBox(
            width: widget.topList.length * 16.0,
            height: 5.0,
            child: Row(
              children: _indicators,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPageView() {
    initFakeList();
    return NotificationListener(
      onNotification: (ScrollNotification note) {
        if (note is ScrollEndNotification || note is UserScrollNotification) {
          _isEndScroll = true;
        } else {
          _isEndScroll = false;
        }
      },
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (BuildContext context, int index) {
          return buildItem(context, index);
        },
        itemCount: _fakeList.length,
        onPageChanged: (index) => changePage(index),
      ),
    );
  }

  Widget buildItem(BuildContext context, int index) {
    PostData item = _fakeList[index];
    return GestureDetector(
      onTap: () {
        fastRoutePageWidgetBuilder(context, PhotoView(item: item));
      },
      onTapDown: (down) {
        _isEndScroll = false;
      },
      onTapUp: (up) {
        _isEndScroll = true;
      },
      child: CachedNetworkImage(
        imageUrl: item.url,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
