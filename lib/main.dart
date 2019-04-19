import 'package:flutter/material.dart';
import 'package:myapp/FormRoute.dart';
import 'package:myapp/WrapRoute.dart';
import 'package:myapp/ScaffoldRoute.dart';
import 'package:myapp/SingleChildScrollViewRoute.dart';
import 'package:myapp/ListViewRoute.dart';
import 'package:myapp/InfiniteListViewRoute.dart';
import 'package:myapp/GridViewRoute.dart';
import 'package:myapp/CustomScrollViewRoute.dart';
import 'package:myapp/ScrollControllerRoute.dart';
import 'package:myapp/ScrollNotificationRoute.dart';
import 'package:myapp/WillPopScopeRoute.dart';
import 'package:myapp/InheritedWidgetRoute.dart';
import 'package:myapp/ThemeRoute.dart';
import 'package:myapp/PointerEventRout.dart';
import 'package:myapp/GestureDetectorRoute.dart';
import 'package:myapp/DragRoute.dart';
import 'package:myapp/ScaleRoute.dart';
import 'package:myapp/GestureRecognizerRoute.dart';
import 'package:myapp/BothDirectionRoute.dart';
import 'package:myapp/GestureConflictRoute.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final List strs = [
    "Form",
    "Wrap",
    "Scaffold",
    "SingleChildScrollView",
    "ListView",
    "InfiniteListView",
    "GridView",
    "CustomScrollView",
    "ScrollController",
    "ScrollNotification",
    "WillPopScope",
    "InheritedWidget",
    "Theme",
    "PointerEvent",
    "GestureDetector",
    "Drag",
    "Scale",
    "GestureRecognizer",
    "BothDirection(手势竞争)",
    "GestureConflict(手势冲突)"
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      routes: {
        "Form": (ctx) => FormRoute(),
        "Wrap": (ctx) => WrapRoute(),
        "Scaffold": (ctx) => ScaffoldRoute(),
        "SingleChildScrollView": (context) => SingleChildScrollViewRoute(),
        "ListView": (ctx) => ListViewRoute(),
        "InfiniteListView": (ctx) => InfiniteListViewRoute(),
        "GridView": (ctx) => GridViewRoute(),
        "CustomScrollView": (ctx) => CustomScrollViewRoute(),
        "ScrollController": (ctx) => ScrollControllerRoute(),
        "ScrollNotification": (ctx) => ScrollNotificationRoute(),
        "WillPopScope": (ctx) => WillPopScopeRoute(),
        "InheritedWidget": (ctx) => InheritedWidgetRoute(),
        "Theme": (ctx) => ThemeRoute(),
        "PointerEvent": (ctx) => PointerEventRoute(),
        "GestureDetector": (ctx) => GestureDetectorRoute(),
        "Drag": (ctx) => DragRoute(),
        "Scale": (ctx) => ScaleRoute(),
        "GestureRecognizer": (ctx) => GestureRecognizerRoute(),
        "BothDirection(手势竞争)": (ctx) => BothDirectionRoute(),
        "GestureConflict(手势冲突)": (ctx) => GestureConflictRoute()
      },
      theme: Theme.of(context),
      home: Scaffold(
          appBar: AppBar(title: Text("Flutter"), centerTitle: true),
          body: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
            children: strs
                .map((e) => Builder(
                      builder: (context) => RaisedButton(
                            child: Text(e),
                            onPressed: () {
                              Navigator.pushNamed(context, e);
                            },
                          ),
                    ))
                .toList(),
          )),
    );
  }
}
