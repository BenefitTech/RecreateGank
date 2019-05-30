import 'package:flutter/material.dart';
import 'package:recreate_gank/common/GlobalConfig.dart';
import 'package:recreate_gank/model/DailyResponse.dart';
import 'package:recreate_gank/utils/PageRouteUtils.dart';

Widget createIdeaCard(BuildContext context, var results) {
  return Container(
    color: GlobalConfig.colorCardBackground,
    margin: EdgeInsets.only(top: 6.0, bottom: 6.0),
    padding: EdgeInsets.only(top: 12.0, bottom: 8.0),
    child: Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16.0, bottom: 20.0),
          child: Row(
            children: <Widget>[
              Container(
                child: CircleAvatar(
                  radius: 20.0,
                  child: Icon(Icons.videocam, color: Colors.white),
                  backgroundColor: GlobalConfig.colorPrimary,
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 8.0),
                  child: Text(
                    '休息视频',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
              Container(
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    '更多',
                    style: TextStyle(color: GlobalConfig.colorPrimary),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 6.0),
          decoration: BoxDecoration(
            color: GlobalConfig.colorSearchBackground,
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
          ),
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text(
                          results != null
                              ? PostData.fromJson(results[1]).desc
                              : "此刻你的桌子是什么样子？",
                          style: TextStyle(color: Colors.black, fontSize: 12.0),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 6.0),
                        child: Text(
                          '晒一晒你的书桌/办公桌',
                          style: TextStyle(color: GlobalConfig.colorFont),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.2,
                child: AspectRatio(
                  aspectRatio: 1.0/1.0,
                  child: Container(
                    foregroundDecoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://pic3.zhimg.com/v2-b4551f702970ff37709cdd7fd884de5e_294x245|adx4.png'),
                        centerSlice: Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.0)
                      )
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
