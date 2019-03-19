import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
/*
https://segmentfault.com/a/1190000011276853

key的作用
首先key有何用尼？
Flutter是受React启发的，所以Virtual Dom的diff算法也参考过来了（应该是略有修改），
在diff的过程中如果节点有Key来比较的话，能够最大程度重用已有的节点（特别在列表的场景），
除了这一点这个Key也用在很多其他的地方这个以后会总结一下。总之，这里我们可以知道key能够<提高性能>，
所以每个Widget都会构建方法都会有一个key的参数可选，贯穿着整个框架。

ValueKey
顺藤摸瓜来到ValueKey，而ValueKey其实就是LocalKey的一个子类，但是LocalKey并没有特别的实现只是简单调用了Key._()构造函数。而ValueKey则是：
  class ValueKey<T> extends LocalKey
构造函数需要传入一个value的参数:
  const ValueKey(this.value);
ValueKey是一个泛型类，并且覆盖了自身的operator==方法（跟 C++覆盖操作符一样），调用了目标类型T的运算符==来比较，当然覆盖了operator==方法也需要覆盖获取hashCode的方法（道理跟Java一样）。所以ValueKey的比较取决于value的operator==的实现，例如Value是字符串类型那就是内容的比较。

ObjectKey
构造函数跟ValueKey差不多:
  const ObjectKey(this.value);
虽然同样覆盖了自身的operator==方法，但是它调用的是identical()方法，所以比较的是value的<引用>。


UniqueKey
也没有特别的实现，没有覆盖operator==方法，所以UniqueKey比较的时候，也就比较引用了（Object默认的operator==调用的就是identical()方法）。
 
 

GlobalKey
abstract class GlobalKey<T extends State<StatefulWidget>> extends Key
也是一个泛型类型，但是T必须要继承自State<StatefulWidget>，可以说这个GlobalKey专门用于组件了。
再看：
  static final Map<GlobalKey, Element> _registry = <GlobalKey, Element>{};
  GlobalKey里含有一个Map，key和value分别为自身和Element。
那什么时候会用到这个Map尼？
跟踪代码很快就找到Element类的mount方法：

  void mount(Element parent, dynamic newSlot) {
      ...
      if (widget.key is GlobalKey) {
        final GlobalKey key = widget.key;
        key._register(this);
      }
    ...
  }
可见GlobalKey会在组件Mount阶段把自身放到一个Map里面缓存起来。
缓存又有何作用尼？
答案依然是为了性能。
思考一个场景，A页面是一个商品列表有许多商品图片（大概就单列这样），B页面是一个商品详情页（有商品大图），当用户在A页面点击一个其中详情，可能会出现一个过渡动画，A页面的商品图片慢慢放大然后下面的介绍文字也会跟着出现，然后就这样平滑的过渡到B页面。
此时A页面和B页面都其实共用了一个商品图片的组件，B页面没必要重复创建这个组件可以直接把A页面的组件“借”过来。
使用GlobalKey的组件生命周期是如何的尼，这里暂时挖一个坑先，哈哈。
总之框架要求同一个父节点下子节点的Key都是唯一的就可以了，GlobalKey可以保证全局是唯一的，所以GlobalKey的组件能够依附在不同的节点上。
而从GlobalKey对象上，你可以得到几个有用的属性currentElement，currentWidget，currentState。

GlobalObjectKey
GlobalObjectKey跟LocalObjectKey也差不多，不同点就在与它是Global的。

LabeledGlobalKey
LabeledGlobalKey是用于调试的。
 */

class WebViewPage extends StatefulWidget {
  final Map<String, dynamic> post;
  WebViewPage({this.post});

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  // bool isLoading = false;
  bool isLoaded = false;
  StreamSubscription<WebViewStateChanged> onStateChanged;
  final flutterWebViewPlugin = FlutterWebviewPlugin();
  void showSnack(String message) {
    scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  void initState() {
    super.initState();

    flutterWebViewPlugin.close();

    onStateChanged =
        flutterWebViewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      print('state: ${state.type}');
      if (state.type == WebViewState.finishLoad) {
        setState(() {
          isLoaded = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    onStateChanged.cancel();
    flutterWebViewPlugin.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.post['url']);

    String title =
        widget.post['desc'] == null ? '一个陌生的地方' : widget.post['desc'];

    List<Widget> titleContent = [];

    if (!isLoaded) {
      titleContent.add(CupertinoActivityIndicator());
    }

    titleContent.add(Expanded(
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 16.0),
      ),
    ));
    return WebviewScaffold(
      key: scaffoldKey,
      url: widget.post['url'],
      withZoom: true,
      withLocalStorage: true,
      withJavascript: true,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: titleContent,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
