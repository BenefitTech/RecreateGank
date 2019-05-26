import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recreate_gank/common/GlobalConfig.dart';
import 'package:recreate_gank/pages/other/components/ShareView.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<ScaffoldState> registKey = GlobalKey();

  String _phoneNum = '';
  String _verifyCode = '';

  Widget _buildPhoneEdit() {
    final node = FocusNode();
    return Padding(
      padding: EdgeInsets.only(left: 40.0, right: 40.0),
      child: TextField(
        onChanged: (str) {
          setState(() {
            _phoneNum = str;
          });
        },
        decoration: InputDecoration(
          hintText: GlobalConfig.inputNice,
          labelText: GlobalConfig.nice,
          hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
        ),
        maxLines: 1,
        maxLength: 11,
        // 键盘展示为号码
        keyboardType: TextInputType.phone,
        // 只能输入数字
        inputFormatters: <TextInputFormatter>[
          WhitelistingTextInputFormatter.digitsOnly
        ],
        onSubmitted: (text) {
          FocusScope.of(context).reparentIfNeeded(node);
        },
      ),
    );
  }

  Widget _buildVerifyCodeEdit() {
    final node = FocusNode();
    Widget verifyCodeEdit = TextField(
      onChanged: (str) {
        setState(() {
          _verifyCode = str;
        });
      },
      decoration: InputDecoration(
        hintText: GlobalConfig.inputCode,
        labelText: GlobalConfig.pwd,
        hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
      ),
      maxLines: 1,
      maxLength: 6,
      // 键盘展示为数字
      keyboardType: TextInputType.number,
      // 只能输入数字
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
      ],
      onSubmitted: (text) {
        FocusScope.of(context).reparentIfNeeded(node);
      },
    );

    return Padding(
      padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 0.0),
      child: Stack(
        children: <Widget>[
          verifyCodeEdit,
        ],
      ),
    );
  }

  Widget _buildRegister() {
    return Padding(
      padding: EdgeInsets.only(top: 30.0, bottom: 30.0),
      child: RaisedButton(
        padding: EdgeInsets.fromLTRB(130.0, 10.0, 130.0, 10.0),
        color: GlobalConfig.colorPrimary,
        textColor: Colors.white,
        disabledColor: Colors.blue[100],
        onPressed: (_phoneNum.isEmpty || _verifyCode.isEmpty)
            ? null
            : () {
                showTips();
              },
        child: Text(
          GlobalConfig.loginSubView,
          style: TextStyle(fontSize: 16.0, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildTips() {
    return Padding(
      padding: EdgeInsets.only(left: 40, right: 40, top: 50, bottom: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/logo.png',
            width: 60,
            height: 60,
          )
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        _buildTips(),
        _buildPhoneEdit(),
        _buildVerifyCodeEdit(),
        _buildRegister()
      ],
    );
  }

  showTips() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Padding(
                padding: EdgeInsets.all(32),
                child: Text(
                  '没有相关接口，这是一个纯UI界面，提供部分交互体验',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).accentColor, fontSize: 24.0),
                )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        key: registKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(GlobalConfig.githubLogin),
          actions: <Widget>[
            InkWell(
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(GlobalConfig.pwdLogin),
              ),
              onTap: (){
                ShareView.buildBottomPop(context);
              },
            )
          ],
        ),
        body: _buildBody(),
      ),
    );
  }
}
