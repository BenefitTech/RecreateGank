import 'package:flutter/material.dart';
import 'ClassifyPageTab.dart';

class ClassifyPage extends StatefulWidget {
  @override
  _ClassifyPageState createState() => _ClassifyPageState();
}

class _ClassifyPageState extends State<ClassifyPage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  List<ClassifyTabPage> tabs;

  @override
  void initState() {
    super.initState();

    tabs = loadClassifyTabs();
    controller = TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          controller: controller,
          indicatorColor: Theme.of(context).primaryColor,
          isScrollable: true,
          tabs: tabs.map((ClassifyTabPage page) {
            return Tab(text: page.text);
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: tabs.map((ClassifyTabPage page) {
          return page.detailPage;
        }).toList(),
      ),
    );
  }
}
