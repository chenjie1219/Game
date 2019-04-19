import 'package:flutter/material.dart';

class GestureConflictRoute extends StatefulWidget {
  @override
  _GestureConflictRouteState createState() => _GestureConflictRouteState();
}

class _GestureConflictRouteState extends State<GestureConflictRoute> {
  double _leftA = 0.0;
  double _leftB = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手势冲突"),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            left: _leftA,
            child: GestureDetector(
              // 要拖动和点击的widget
              child: CircleAvatar(
                child: Text("A"),
              ),
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _leftA += details.delta.dx;
                });
              },
              onHorizontalDragEnd: (details) {
                print("A onHorizontailDragEnd");
              },
              onTapDown: (details) {
                print("A down");
              },
              onTapUp: (details) {
                // 拖动A后不触发
                print("A up");
              },
            ),
          ),
          // 手势冲突只是手势级别的，而手势是对原始指针的语义化的识别
          // 所以在遇到复杂的冲突场景时，都可以通过Listener直接识别原始指针事件来解决冲突。
          Positioned(
            top: 80.0,
            left: _leftB,
            child: Listener(
              onPointerDown: (PointerDownEvent event) {
                print("B down");
              },
              onPointerUp: (PointerUpEvent event) {
                //会触发
                print("B up");
              },
              child: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  child: Text("B"),
                ),
                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _leftB += details.delta.dx;
                  });
                },
                onHorizontalDragEnd: (details) {
                  print("B onHorizontalDragEnd");
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
