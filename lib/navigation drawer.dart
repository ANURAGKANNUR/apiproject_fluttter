
import 'package:apiproject_fluttter/product%20model.dart';
import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  Navigation({Key? key}) : super(key: key);
  int itemcount = Category.values.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(


        appBar: AppBar(
          title: Text("Categories"),
        ),
        body: ListView.builder(
            // scrollDirection: Axis.vertical,
            // shrinkWrap: true,
            itemCount: Category.values.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.fromLTRB(0,25, 0, 0),
                height: 50,
                child: Text(Category.values[index].name),
              );
            }
        )
    );
  }
}
