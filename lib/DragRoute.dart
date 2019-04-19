import 'package:flutter/material.dart';

class DragRoute extends StatefulWidget {
  @override
  _DragRouteState createState() => _DragRouteState();
}

class _DragRouteState extends State<DragRoute> {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("拖动(任意方向)"),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text("A"),
              ),
              // 手指按下时会触发此回调
              onPanDown: (DragDownDetails e) {
                // 打印手指按下的位置(相对于屏幕)
                print("用户手指按下：${e.globalPosition}");
              },
              // 手指滑动时会触发此回调
              // 水平方向拖动事件 onHorizontalDragUpdate
              // 垂直方向拖动事件 onVerticalDragUpdate
              onPanUpdate: (DragUpdateDetails e) {
                // 用户手指滑动时，更新偏移，重新构建
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              },
              onPanEnd: (DragEndDetails e) {
                // 打印滑动结束时在x、y轴上的速度
                print(e.velocity);
              },
            ),
          )
        ],
      ),
    );
  }
}
