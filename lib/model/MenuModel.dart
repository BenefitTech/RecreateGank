const String _wx = '微信好友';
const String _wx_circle = '微信朋友圈';
const String _sina = '新浪微博';
const String _msg = '短信';

class Menu {
  final int index;
  final String title;
  final String icon;
  const Menu({this.index,this.title,this.icon});
}

const List<Menu> menus_share = const <Menu>[
  Menu(index: 0,title: _wx,icon: 'images/icon_wx.png'),
  Menu(index: 1,title: _wx_circle,icon: 'images/icon_circle.png'),
  Menu(index: 2,title: _sina,icon: 'images/icon_sina.png'),
  Menu(index: 3,title: _msg,icon: 'images/icon_msg.png'),
];

const List<Menu> menus_login = const <Menu>[
  Menu(index: 0, title: _wx, icon: "images/icon_wx.png"),
  Menu(index: 1, title: _sina, icon: "images/icon_sina.png"),
];
