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
          child: FlatButton(
            onPressed: () {
              fastRoutePageWidgetBuilder(context, LoginPage());
            },
            child: Container(
              child: ListTile(
                leading: Container(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://pic1.zhimg.com/v2-ec7ed574da66e1b495fcad2cc3d71cb9_xl.jpg"),
                    radius: 20.0,
                  ),
                ),
                title: Container(
                  margin: EdgeInsets.only(top: 2.0),
                  child: Text(GlobalConfig.loginSubTitle),
                ),
              ),
            ),
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: (MediaQuery.of(context).size.width - 6.0) * 0.25,
                child: FlatButton(
                  onPressed: () {
                    fastRouteWebPageBuilder(
                        context,
                        GlobalConfig.flutterVersion,
                        GlobalConfig.flutterGithubUrl);
                  },
                  child: Container(
                    height: 50.0,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            '185',
                            style: TextStyle(
                                fontSize: 16.0, color: GlobalConfig.colorFont),
                          ),
                        ),
                        Container(
                          child: Text(
                            GlobalConfig.flutterVersion,
                            style: TextStyle(
                                fontSize: 12.0, color: GlobalConfig.colorFont),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 14.0,
                width: 1.0,
                decoration: BoxDecoration(
                    border: BorderDirectional(
                        start: BorderSide(color: Colors.black12, width: 1.0))),
              ),
              Container(
                width: (MediaQuery.of(context).size.width - 6.0) * 0.25,
                child: FlatButton(
                  onPressed: () {
                    fastRouteWebPageBuilder(context, GlobalConfig.wxVersion,
                        GlobalConfig.wxGithubUrl);
                  },
                  child: Container(
                    height: 50.0,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            '17',
                            style: TextStyle(
                                fontSize: 16, color: GlobalConfig.colorFont),
                          ),
                        ),
                        Container(
                          child: Text(
                            GlobalConfig.wxVersion,
                            style: TextStyle(
                                fontSize: 12, color: GlobalConfig.colorFont),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 14.0,
                width: 1.0,
                decoration: BoxDecoration(
                    border: BorderDirectional(
                        start: BorderSide(color: Colors.black12, width: 12.0))),
              ),
              Container(
                width: (MediaQuery.of(context).size.width - 6) * 0.25,
                child: FlatButton(
                  onPressed: () {
                    fastRouteWebPageBuilder(
                        context,
                        GlobalConfig.androidVersion,
                        GlobalConfig.androidGithubUrl);
                  },
                  child: Container(
                    height: 50.0,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            '218',
                            style: TextStyle(
                                fontSize: 16.0, color: GlobalConfig.colorFont),
                          ),
                        ),
                        Container(
                          child: Text(
                            GlobalConfig.androidVersion,
                            style: TextStyle(
                                fontSize: 12.0, color: GlobalConfig.colorFont),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 14.0,
                width: 1.0,
                decoration: BoxDecoration(
                    border: BorderDirectional(
                        start: BorderSide(color: Colors.black12, width: 1.0))),
              ),
              Container(
                width: (MediaQuery.of(context).size.width - 6) * 0.25,
                child: FlatButton(
                  onPressed: () {
                    fastRouteWebPageBuilder(context, GlobalConfig.iosVersion,
                        GlobalConfig.iosGithubUrl);
                  },
                  child: Container(
                    height: 50.0,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            '33',
                            style: TextStyle(
                                fontSize: 16.0, color: GlobalConfig.colorFont),
                          ),
                        ),
                        Container(
                          child: Text(
                            GlobalConfig.iosVersion,
                            style: TextStyle(
                                fontSize: 12.0, color: GlobalConfig.colorFont),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
