import 'package:flutter/material.dart';
import 'package:recreate_gank/pages/login/LoginPage.dart';
import 'package:recreate_gank/utils/PageRouteUtils.dart';
import 'package:recreate_gank/common/GlobalConfig.dart';

Widget createMyInfoCard(BuildContext context) {
  return Container(
    color: GlobalConfig.colorCardBackground,
    margin: EdgeInsets.only(top: 10.0, bottom: 6.0),
    padding: EdgeInsets.only(top: 12.0, bottom: 8.0),
    child: Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(Radius.circular(6.0))),
          child: FlatButton(onPressed: (){
            fastRoutePageWidgetBuilder(context, LoginPage());
            
          },),
        )
      ],
    ),
  );
}
