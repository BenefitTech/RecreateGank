import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:recreate_gank/utils/SharedUtils.dart';

//HTTP请求的函数返回值为异步控件Future
Future<String> future({String url}) async {
  var httpClient = HttpClient();
  var request = await httpClient.getUrl(Uri.parse(url));
  var response = await request.close();
  return await response.transform(utf8.decoder).join();
}

// 通过url判断是否存在缓存,url是缓存数据的key
Future<Object> getNetworkDataOrCachedData(
    {bool forceRequest, bool cached, String url}) async {
  if (forceRequest) {
    Future<Object> futureData = future(url: url);
    futureData.then((Object data) {
      // 缓存网络数据
      if (cached) {
        SharedUtils.saveString(url, json.encode(data));
        print('---把网络请求数据缓存---\n$data');
      }
    });
    return futureData;
  } else {
    // 先通过url获取缓存中的数据
    var cacheData = await SharedUtils.get(url);
    if (cacheData != null) {
      print('---缓存数据---\n$cacheData');
      return json.decode(cacheData);
    } else {
      Future<Object> futureData = future(url: url);
      futureData.then((Object data) {
        if (cached) {
          // 缓存网络数据
          SharedUtils.saveString(url, json.encode(data));
          print('---把网络请求数据缓存---\n$data');
        }
      });
      return futureData;
    }
  }
}
