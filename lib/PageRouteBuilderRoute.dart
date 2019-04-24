import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/ListViewRoute.dart';

class PageRouteBuilderRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PageRouteBuilder"),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Push"),
          onPressed: () {
            Navigator.push(
                context,
                PageRouteBuilder(
                    transitionDuration:
                        Duration(milliseconds: 500), //动画时间为500毫秒
                    pageBuilder: (BuildContext context, Animation animation,
                        Animation secondaryAnimation) {
                      return FadeTransition(
                        //使用淡入淡出效果
                        opacity: animation,
                        child: ListViewRoute(),
                      );
                    }));
          },
        ),
      ),
    );
  }
}
