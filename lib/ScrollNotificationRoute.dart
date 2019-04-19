import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ScrollNotificationRoute extends StatefulWidget {
  @override
  _ScrollNotificationRouteState createState() =>
      _ScrollNotificationRouteState();
}

class _ScrollNotificationRouteState extends State<ScrollNotificationRoute> {
  var _progress = "0%"; //保存进度百分比
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动监听"),
        centerTitle: true,
      ),
      body: CupertinoScrollbar(
        //监听滚动通知
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            var progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
            setState(() {
              _progress = "${(progress * 100).toInt()}%";
            });
            print("BottomEdge:${notification.metrics.extentAfter == 0}");
            // return true; //放开此行注释后，滚动条将失效
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                itemCount: 100,
                itemExtent: 50.0,
                itemBuilder: (ctx, i) {
                  return ListTile(
                    title: Text("$i"),
                  );
                },
              ),
              //显示进度百分比
              CircleAvatar(
                radius: 30.0,
                child: Text(_progress),
                backgroundColor: Colors.black54,
              )
            ],
          ),
        ),
      ),
    );
  }
}
