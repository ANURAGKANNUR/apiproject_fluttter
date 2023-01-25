import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
          height: double.infinity,
        color: Colors.red,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              SizedBox(
                height: 80,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text("settings",style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),),
                ),

              ),
              ListTile(

                title: Text("Categories",style:
                  TextStyle(
                    fontSize: 20,
                  ),),
              ),
              Spacer(),
              ListTile(
                title: Text("Help center"),
              )
            ],
          ),
        ),
      ),
    );
  }
}



