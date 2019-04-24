import 'package:flutter/material.dart';

// 路由A
class HeroAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero动画"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: InkWell(
          child: Hero(
            tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
            child: ClipOval(
              child: Image.asset("assets/kong.jpg", width: 50.0),
            ),
          ),
          onTap: () {
            // 打开路由B
            Navigator.push(context, PageRouteBuilder(
                pageBuilder: (ctx, animation, secondaryAnimation) {
              return FadeTransition(
                opacity: animation,
                child: HeroAnimationRouteB(),
              );
            }));
          },
        ),
      ),
    );
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("原图"),
        centerTitle: true,
      ),
      body: Center(
        child: Hero(
          tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
          child: Image.asset("assets/kong.jpg"),
        ),
      ),
    );
  }
}
