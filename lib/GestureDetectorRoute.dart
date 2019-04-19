import 'package:flutter/material.dart';

class GestureDetectorRoute extends StatefulWidget {
  @override
  _GestureDetectorRouteState createState() => _GestureDetectorRouteState();
}

class _GestureDetectorRouteState extends State<GestureDetectorRoute> {
  String _operation = "No Gesture detected"; // 保存事件名
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手势检测(点击、双击、长按)"),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 200.0,
            height: 100.0,
            child: Text(
              _operation,
              style: TextStyle(color: Colors.white),
            ),
          ),
          onTap: () => updateText("Tap"), //点击
          onDoubleTap: () => updateText("DoubleTap"), //双击
          onLongPress: () => updateText("LongPress"), //长按
        ),
      ),
    );
  }

  void updateText(String text) {
    //更新显示的事件名
    setState(() => _operation = text);
  }
}
// 注意：
// 当同时监听onTap和onDoubleTap事件时，当用户触发tap事件时，会有200毫秒左右的延时
// 这是因为当用户点击完之后很可能会再次点击以触发双击事件，所以GestureDetector会等一断时间来确定是否为双击事件。
// 如果用户只监听了onTap（没有监听onDoubleTap）事件时，则没有延时。
