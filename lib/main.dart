import 'package:apiproject_fluttter/registration.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'api.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: ApiTest(),
    );
  }
}


// class apitest extends StatelessWidget {
//   const apitest({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: ElevatedButton(onPressed:getdata,
//           child: Text("show")),
//     );
//   }
// }
