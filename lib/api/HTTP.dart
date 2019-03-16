import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:recreate_gank/model/DailyResponse.dart';

class HTTP {
  // [] 表示可忽略参数，{} 都表示调用时需要显示参数名
  Future<String> getRequest(String url, [Map params]) async {
    http.Response response = await http.get(url, headers: params);
    return response.body.toString();
  }

  Future<CategoryResponse> getGankFromNet(String url) async {
    final responseString = await getRequest(url);
    return CategoryResponse.fromJson(jsonDecode(responseString));
  }

  // CategoryResponse toGankList(String responseString)=>

  Future<GankPost> getGankDayData(String url) async {
    final responseStr = await getRequest(url);

    return GankPost.fromJson(jsonDecode(responseStr));
  }

  static void get(String url, Function callback, Function errorCallback) async {
    try {
      http.Response response = await http.get(url);
      if (callback != null) {
        callback(response.body);
      }
    } catch (e) {
      if (errorCallback != null) {
        errorCallback(e);
      }
    }
  }

  // 具名函数
  //    要达到具名函数的用法，那就在定义的时候给参数加上 {}
  // 可选的位置参数
  //    和 JavaScript不一样的地方是，Dart某些位置可忽略的参数必须在函数定义时用 []符号指定：
  static void post(String url, Function callback,
      {Map<String, String> params, Function errorCallback}) async {
    try {
      http.Response response = await http.post(url, body: params);
      if (callback != null) {
        callback(response.body);
      }
    } catch (e) {
      if (errorCallback != null) {
        errorCallback(e);
      }
    }
  }
}
