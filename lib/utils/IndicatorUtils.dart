/*
 Flutter使用InkWell无水波纹效果
正常情况下使用方式：
InkWell(
      onTap: () { },
      child: Container(
               height: 50,
               child: Text( "是速度",
                          maxLines: 1,
                          style: TextStyle(color: color),
                          overflow: TextOverflow.ellipsis,
                              ),
          ),
  )

如果在InkWell的上下都出现的颜色的设置，如上中的Container中如果加入了color:Colors.white,这时候InkWell的水波纹效果会无效

解决方案是：在InkWell的外层再套上Matetial 以及 Ink组件
Material(
  child: Ink(
    child:
      InkWell(
        onTap: () { },
        child: Container(
           height: 50.0,
           color: Colors.white,
           child: Text( "是速度",
               maxLines: 1,
               style: TextStyle(color: color),
               overflow: TextOverflow.ellipsis,
               ),
          ),
      ),
    ),
  )

 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:recreate_gank/common/GlobalConfig.dart';

class IndicatorFactory {
  Widget buildDefaultHeader(BuildContext context, RefreshStatus status) {
    return ClassicIndicator(
      failedText: "刷新失败",
      completeText: '刷新完成！',
      releaseText: '释放可以刷新',
      idleText: '下拉刷新哦！',
      failedIcon: Icon(Icons.clear, color: GlobalConfig.colorPrimary),
      completeIcon: Icon(Icons.forward_30, color: GlobalConfig.colorPrimary),
      idleIcon: Icon(Icons.arrow_downward, color: GlobalConfig.colorPrimary),
      releaseIcon: Icon(Icons.arrow_upward, color: GlobalConfig.colorPrimary),
      refreshingText: '正在刷新。。。',
      textStyle: TextStyle(inherit: true, color: GlobalConfig.colorPrimary),
      mode: status,
      refreshingIcon: CircularProgressIndicator(
        strokeWidth: 3.0,
        valueColor: AlwaysStoppedAnimation(Colors.red),
      ),
    );
  }

  Widget buildDefaultFooter(BuildContext context, RefreshStatus status,
      [Function requestLoad]) {
    switch (status) {
      case RefreshStatus.failed:
      case RefreshStatus.idle:
        return InkWell(
          child: ClassicIndicator(
            mode: status,
            idleIcon:
                Icon(Icons.arrow_upward, color: GlobalConfig.colorPrimary),
            textStyle:
                TextStyle(inherit: true, color: GlobalConfig.colorPrimary),
            releaseIcon:
                Icon(Icons.arrow_upward, color: GlobalConfig.colorPrimary),
            refreshingText: '火热加载中。。。',
            idleText: '网络异常',
            failedText: '网络异常',
            releaseText: '释放可以加载',
            noDataText: '没有更多数据',
            refreshingIcon: CircularProgressIndicator(
              strokeWidth: 3.0,
              valueColor: AlwaysStoppedAnimation(Colors.red),
            ),
          ),
          onTap: requestLoad,
        );

      default:
        return ClassicIndicator(
            mode: status,
            idleIcon:
                Icon(Icons.arrow_upward, color: GlobalConfig.colorPrimary),
            textStyle:
                TextStyle(inherit: true, color: GlobalConfig.colorPrimary),
            releaseIcon:
                Icon(Icons.arrow_upward, color: GlobalConfig.colorPrimary),
            refreshingText: '火热加载中。。。',
            idleText: '上拉加载',
            failedText: '网络异常',
            releaseText: '释放可以加载',
            refreshingIcon: const CircularProgressIndicator(
              strokeWidth: 3.0,
              valueColor: AlwaysStoppedAnimation(Colors.red),
            ),
            noDataText: '没有更多数据');
    }
  }
}
