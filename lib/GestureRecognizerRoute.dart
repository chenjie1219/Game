import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class GestureRecognizerRoute extends StatefulWidget {
  @override
  _GestureRecognizerRouteState createState() => _GestureRecognizerRouteState();
}

class _GestureRecognizerRouteState extends State<GestureRecognizerRoute> {
  TapGestureRecognizer _tapRecognizer = TapGestureRecognizer();
  bool _toggle = false; //变色开关

  @override
  void dispose() {
    //注意：使用GestureRecognizer后一定要调用其dispose()方法来释放资源（主要是取消内部的计时器）
    _tapRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GestureRecognizer"),
        centerTitle: true,
      ),
      body: Center(
        child: Text.rich(TextSpan(children: [
          TextSpan(text: "你好世界"),
          TextSpan(
              text: "点我变色",
              style: TextStyle(
                  fontSize: 30.0, color: _toggle ? Colors.blue : Colors.red),
              recognizer: _tapRecognizer
                ..onTap = () {
                  setState(() {
                    _toggle = !_toggle;
                  });
                }),
          TextSpan(text: "你好世界")
        ])),
      ),
    );
  }
}
