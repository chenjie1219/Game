import 'package:flutter/material.dart';
import 'dart:ui';

class GaussianBlurRoute extends StatefulWidget {
  @override
  _GaussianBlurRouteState createState() => _GaussianBlurRouteState();
}

class _GaussianBlurRouteState extends State<GaussianBlurRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("高斯模糊(毛玻璃效果)"),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Image.network("http://qiniu.nightfarmer.top/恶龙咆哮.gif",width: 300,height: 300,),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3,sigmaY: 3),
              child: Container(
                color: Colors.white.withOpacity(0.1),
                width: 300,
                height: 300,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text("Hello",style: TextStyle(fontSize: 18),),
                ),
              ),
            )
          ],
        ),

      ),
    );
  }
}
