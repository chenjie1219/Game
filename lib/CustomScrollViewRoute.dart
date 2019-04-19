import 'package:flutter/material.dart';

class CustomScrollViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
                title: Text("CustomScrollView"),
                centerTitle: true,
                background: Image.asset(
                  "assets/kong.jpg",
                  fit: BoxFit.cover,
                )),
          ),
          SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: SliverChildBuilderDelegate((ctx, i) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.cyan[100 * (i % 9)],
                  child: Text("grid item $i"),
                );
              }, childCount: 20),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate((ctx, i) {
              return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (i % 9)],
                  child: Text("list item $i"));
            }, childCount: 50),
          )
        ],
      ),
    );
  }
}
