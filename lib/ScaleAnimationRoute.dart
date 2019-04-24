import 'package:flutter/material.dart';

class GrowTransition extends StatelessWidget {
  GrowTransition({Key key, this.child, this.animation}) : super(key: key);
  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      // AnimatedBuilder的好处：
      // 不用显式的去添加帧监听器，然后再调用setState() 了，这个好处和AnimatedWidget是一样的。
      // 动画构建的范围缩小了，如果没有builder，setState()将会在父widget上下文调用，这将会导致父widget的build方法重新调用，而有了builder之后，只会导致动画widget的build重新调用，这在复杂布局下性能会提高。
      // 通过AnimatedBuilder可以封装常见的过渡效果来复用动画。
      child: AnimatedBuilder(
        animation: animation,
        child: child,
        builder: (ctx, child) {
          return Container(
            width: animation.value,
            height: animation.value,
            child: child,
          );
        },
      ),
    );
  }
}

class ScaleAnimationRoute extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => _ScaleAnimationRouteState();
}

// 需要继承TickerProvider,如果有多个AnimationController,则应该使用SingleTickerProviderStateMixin
class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    // 使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    // 图片宽高从0变到300
    animation = Tween(begin: 0.0, end: 300.0).animate(controller);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // 动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        // 动画恢复到初始状态时执行动画(正向)
        controller.forward();
      }
    });

    // 启动动画(正向)
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("图片放大动画"),
          centerTitle: true,
        ),
        body: GrowTransition(
          child: Image.asset("assets/kong.jpg"),
          animation: animation,
        ));
  }

  @override
  void dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}
