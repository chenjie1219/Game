import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget{
  MyDrawer({Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child:MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset("assets/kong.jpg",width: 80)
                    ),
                  ),
                  Text("Jason",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 28.0))
                ],
              ),
            )
          ],

        ),
      )
    );
  }
}