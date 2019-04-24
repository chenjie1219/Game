import 'package:flutter/material.dart';
import 'package:myapp/ListViewRoute.dart';

class FadeRoute extends PageRoute {
  FadeRoute(
      {@required this.builder,
      this.transitionDuration = const Duration(milliseconds: 300),
      this.opaque = true,
      this.barrierDismissible = false,
      this.barrierColor,
      this.barrierLabel,
      this.maintainState = true});
  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    //当前路由被激活，是打开新路由
    if (isActive) {
      return FadeTransition(
        opacity: animation,
        child: builder(context),
      );
    } else {
      //是返回，则不应用过渡动画
      return Padding(
        padding: EdgeInsets.zero,
      );
    }
  }
}

class CustomPageRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CustomPageRoute"),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Push"),
          onPressed: () {
            Navigator.push(context, FadeRoute(builder: (context) {
              return ListViewRoute();
            }));
          },
        ),
      ),
    );
  }
}
