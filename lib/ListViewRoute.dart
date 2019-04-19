import 'package:flutter/material.dart';

class ListViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget divider1=Divider(color: Colors.red);
    Widget divider2=Divider(color: Colors.blue);
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        centerTitle: true
      ),
      body: ListView.separated(
        itemCount: 100,
        itemBuilder: (ctx,i)=>ListTile(
          title: Text("$i"),
        ),
        separatorBuilder: (ctx,i)=>(i%2==0?divider1:divider2),
      ),
    );
  }
}