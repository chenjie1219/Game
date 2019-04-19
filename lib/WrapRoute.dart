import 'package:flutter/material.dart';

class WrapRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("wrap"), centerTitle: true),
        body: Wrap(
          spacing: 8.0,
          runSpacing: 0.0,
          alignment: WrapAlignment.center,
          children: <Widget>[
            Chip(
                avatar: CircleAvatar(
                    backgroundColor: Colors.blue, child: Text("A")),
                label: Text("abcdefg")),
            Chip(
              avatar: new CircleAvatar(
                  backgroundColor: Colors.blue, child: Text('M')),
              label: new Text('hijklmn'),
            ),
            Chip(
              avatar: new CircleAvatar(
                  backgroundColor: Colors.blue, child: Text('H')),
              label: new Text('opqrst'),
            ),
            Chip(
              avatar: new CircleAvatar(
                  backgroundColor: Colors.blue, child: Text('J')),
              label: new Text('uvwxyz'),
            ),
            Chip(
              avatar: new CircleAvatar(
                  backgroundColor: Colors.blue, child: Text('J')),
              label: new Text('haha'),
            ),
          ],
        ));
  }
}
