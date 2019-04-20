import 'package:flutter/material.dart';
import 'package:recreate_gank/common/GlobalConfig.dart';

class HistoryTitle extends StatefulWidget {
  HistoryTitle(this.category);
  final String category;

  @override
  _HistoryTitleState createState() => _HistoryTitleState();
}

class _HistoryTitleState extends State<HistoryTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: GlobalConfig.colorCardBackground,
        border: Border(
          bottom: BorderSide(width: 0.0, color: Theme.of(context).dividerColor),
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.0),
            width: 4.0,
            height: 20.0,
            color: Theme.of(context).primaryColor,
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Text(
              widget.category,
              style: Theme.of(context).textTheme.title,
            ),
          )
        ],
      ),
    );
  }
}
