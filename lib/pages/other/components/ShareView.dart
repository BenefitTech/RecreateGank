import 'package:flutter/material.dart';
import 'package:recreate_gank/model/MenuModel.dart';

class ShareView {
  static buildBottomPop(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 120.0,
            color: Colors.white,
            child: GridView.count(
              crossAxisCount: 4,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              padding: EdgeInsets.all(4.0),
              children: menus_share.map((Menu m) {
                return GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                        child: Image.asset(m.icon, width: 40.0, height: 40.0),
                      ),
                      Text(m.title),
                    ],
                  ),
                );
              }).toList(),
            ),
          );
        });
  }
}
