import 'package:flutter/material.dart';
import 'package:recreate_gank/common/GlobalConfig.dart';

class SlideDrawPage extends StatelessWidget {
  String email, name, profileImgPath, backgroudImgPath;
  SlideDrawPage(
      {this.email, this.name, this.profileImgPath, this.backgroudImgPath});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountEmail: Text(email),
          accountName: Text(name),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage(profileImgPath),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backgroudImgPath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        ListTile(
          title: Text(GlobalConfig.welfare),
          trailing: Icon(
            Icons.whatshot,
            color: Colors.red,
          ),
          onTap: () {
            print('home');
            Navigator.of(context).pop();
            // routePageBuilder(context, GlobalConfig.welfare);
          },
        ),
      ],
    );
  }
}
