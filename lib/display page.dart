import 'package:flutter/material.dart';
import 'product model.dart';

class Display extends StatelessWidget {
  const Display({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),

      ),
      body:Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 80,),
          Row(
            children: [
              Container(
                child: Image.network('https://upload.wikimedia.org/wikipedia/commons/3/3b/Prithviraj_oil_paint_2019.jpg')
                ,
                width: MediaQuery.of(context).size.width / 2,
              ),
              SizedBox(width: 10,),
              Column(
                  children: [
                    Text("PRITHVIRAJ SUKUMARAN",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),),
                    Text("Indian actor,director, producer \nand playback singer")
                  ],

              ),


            ],

          ),
 

        ],
      )
    );
  }
}
