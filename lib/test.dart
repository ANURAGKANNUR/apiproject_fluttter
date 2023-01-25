// import 'package:apiproject_fluttter/product%20model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'details.dart';
import 'navigation drawer.dart';
import 'product model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class apitest extends StatefulWidget {
  const apitest({Key? key}) : super(key: key);

  @override
  State<apitest> createState() => _apitestState();
}

class _apitestState extends State<apitest> {

  bool isGrid=false;
  List<Product> _products = [];

  Future<void> getdata() async {
    try{
      CircularProgressIndicator();
      final response =
      await http.get(Uri.parse('https://fakestoreapi.com/products'));

      setState(() {
        _products = productFromJson(response.body);
      });
    }
    catch(_){
      print(_);
    }
    finally{
      print("finally");
    }

    // var json = jsonDecode(response.body) ;

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  // void img(){
  //   print(_product.image);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navigation(),

      appBar: AppBar(
        title: Text("Products"),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              if(isGrid==false){
                isGrid=!isGrid;
              }
              else{
                isGrid=!isGrid;
              }
            });
          },
            icon:isGrid
                ?Icon(Icons.list,color: Colors.white,)
                :Icon(Icons.grid_view,color: Colors.white,),
          )
        ],
      ),
      body:ListView.builder(
          itemCount: _products.length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Card(
                        color: Colors.white38,
                        // margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: (){
                              // int qt=_products[index].rating.count;
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context)=> DisplayPage(id:_products[index].id,
                                    title:_products[index].title,
                                    image:_products[index].image,
                                    qty:_products[index].rating?.count.toString(),
                                    price:_products[index].price.toString(),
                                    rating:_products[index].rating!.rate.toDouble(),
                                    discription:_products[index].description,
                                  )
                              ));
                            },
                            child: Image.network(
                              _products[index].image,
                              height: 90,
                              width: 120,
                            ),
                          ),
                        ),
                        //         height: 150,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_products[index].title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Text(
                                      '\u{20B9}${_products[index].price}',
                                      textAlign: TextAlign.left,
                                    )),
                                Padding(
                                  padding:
                                  const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: Text(
                                    "x${_products[index].rating?.count}",
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${_products[index].rating?.rate}",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),

                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
