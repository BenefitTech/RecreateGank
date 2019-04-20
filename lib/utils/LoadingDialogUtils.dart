import 'package:flutter/material.dart';

class LoadingDialogUtils extends Dialog {
  String text;
  BuildContext context;

  LoadingDialogUtils({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return Material(
      // 创建透明层
      type: MaterialType.transparency,
      child: Center(
        child: SizedBox(
          width: 120,
          height: 120,
          child: Container(
            decoration: ShapeDecoration(
              color: Color(0xffffff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 12),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  dismiss() {
    Navigator.of(context).pop();
  }
}
