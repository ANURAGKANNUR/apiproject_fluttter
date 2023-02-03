
import 'package:apiproject_fluttter/product%20model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:expandable_text/expandable_text.dart';
import 'display page.dart';
import 'navigation drawer.dart';
import 'display page.dart';

class DisplayPage extends StatelessWidget {
   DisplayPage({Key? key, required this.id,required this.title, required this.image, required this.qty, required this.price, required this.rating, required this.discription
   }) : super(key: key);

  List<Product> _product = [];
  final int id;
  final String title;
  final String image;
  final String? qty;
  final String price;
  final double rating;
  final String? discription;




   @override
  Widget build(BuildContext context) {
    return  Scaffold(

      // appBar: AppBar(
      //   title: Text("Details"),
      //
      // ),
      body: NestedScrollView(
        body: Column(
          children: [
            Expanded(
              child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
              children: [
                  SizedBox(height:30),
                //   Align(
                //     alignment: Alignment.topRight,
                //     child: RatingBarIndicator(
                //     rating: rating,
                //     itemBuilder: (context, index) => const Icon(
                //     Icons.star,
                //     color: Colors.amber,
                // ),
                // itemCount: 5,
                // itemSize: 23.0,
                //     ),
                //   ),
                  SizedBox(height: 30),
                  // Hero(
                  //   tag: "image1",
                  //   child: Image(image: NetworkImage(
                  //     image
                  //   ),
                  //   height: 200,
                  //   width: 250,),
                  // ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(26, 20, 26, 0),
                  child: ExpandableText(discription!,
                    expandText: "show more",
                      collapseText:"show less"
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(26, 20, 0, 0),
                  child: Text(title,style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,

                  ),
                  ),
                ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(26, 20, 0, 0),
                      child: Text("Price:  \u{20B9}$price",

                        style: const TextStyle(
                        fontSize: 25,

                        fontWeight: FontWeight.w500,
                      ),),
                    ),
                  ),
                Align(
                  alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(26, 20, 0, 0),
                      child: Text("Qty : $qty",
                          style: const TextStyle(
                            fontSize: 22,

                            fontWeight: FontWeight.w500,
                          ),),
                    )),


              ],
              ),
            ),

            Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){

                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white38,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),),
                    minimumSize:const Size(200.0, 80.0),
                  ), child: const Text("Add to Cart ",style:
                TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black
                ),),
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).pop(MaterialPageRoute(
                      builder: (context)=>const Display()
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("order placed successfully",
                      style: TextStyle(
                        color: Colors.green
                      ),),)
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),),
                    minimumSize:Size(200.0, 80.0),

                  ),
                  child: const Text("Buy Now",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),),
                )

              ],
            ),
            const SizedBox(height: 10,)
          ],
        ), headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return[
            SliverAppBar(
                expandedHeight:230 ,
                iconTheme: IconThemeData(
                  color: Colors.black
                ),
                backgroundColor: Colors.white,
              flexibleSpace:FlexibleSpaceBar(
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height:30,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,24,0,0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: RatingBarIndicator(
                          rating: rating,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 23.0,
                        ),
                      ),
                    ),
                    Hero(
                      tag: "image1",
                      child: Image(image: NetworkImage(
                          image
                      ),
                        height: 200,
                        width: 250,),
                    ),

                  ],
                ),
              )
            )
          ];
      },
      )

    );
  }
}

