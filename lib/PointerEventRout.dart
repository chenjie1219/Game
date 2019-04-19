import 'package:flutter/material.dart';

class PointerEventRoute extends StatefulWidget {
  @override
  _PointerEventRouteState createState() => _PointerEventRouteState();
}

class _PointerEventRouteState extends State<PointerEventRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("原始指针事件"),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            Listener(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.blue),
                ),
              ),
              onPointerDown: (PointerDownEvent event) => print("down0"),
            ),
            Listener(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints.tightFor(width: 200.0, height: 100.0),
                child: Center(
                  child: Text("左上角200*100范围内非文本区域点击"),
                ),
              ),
              onPointerDown: (PointerDownEvent event) => print("down1"),
              // behavior: HitTestBehavior.translucent,
              // deferToChild：子widget会一个接一个的进行命中测试，如果子Widget中有测试通过的，则当前Widget通过，这就意味着，如果指针事件作用于子Widget上时，其父(祖先)Widget也肯定可以收到该事件。
              // opaque：在命中测试时，将当前Widget当成不透明处理(即使本身是透明的)，最终的效果相当于当前Widget的整个区域都是点击区域。
              // translucent：当点击Widget透明区域时，可以对自身边界内及底部可视区域都进行命中测试，这意味着点击顶部widget透明区域时，顶部widget和底部widget都可以接收到事件
            ),
            Positioned(
              bottom: 0,
              child: Listener(
                // 忽略PointerEvent
                // AbsorbPointer本身会参与命中测试，而IgnorePointer本身不会参与
                child: AbsorbPointer(
                  child: Listener(
                    child: Container(
                      color: Colors.red,
                      width: 200.0,
                      height: 100.0,
                    ),
                    onPointerDown: (event) => print("in"),
                  ),
                ),
                onPointerDown: (event) => print("up"),
              ),
            )
          ],
        ));
  }
}
