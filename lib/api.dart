import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'details.dart';
import 'navigation drawer.dart';
import 'product model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ApiTest extends StatefulWidget {
  const ApiTest({Key? key}) : super(key: key);

  @override
  State<ApiTest> createState() => _ApiTestState();
}

class _ApiTestState extends State<ApiTest> {

  bool isGrid=false;
  List<Product> _products = [];
  bool isLoading=false;

  Future<void> getData() async {
    try{
      final response =
      await http.get(Uri.parse('https://fakestoreapi.com/products'));

      setState(() {
        _products = productFromJson(response.body);
        isLoading=true;
        if (kDebugMode) {
          print("1 set");
        }
      });
      await Future.delayed(const Duration(seconds: 5));
      setState(() {
        isLoading=false;
        if (kDebugMode) {
          print("2 set");
        }
      });
    }
    catch(_){
    }
    finally{
    }

    // var json = jsonDecode(response.body) ;

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  // void img(){
  //   print(_product.image);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navigation(),

      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              isGrid=!isGrid;
            });
          },
              icon:isGrid
              ?const Icon(Icons.list,color: Colors.white,)
              :const Icon(Icons.grid_view,color: Colors.white,),
          )
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10)
          )
        ),
      ),
      body: Center(
        child: isLoading
          ?const CircularProgressIndicator()
            :isGrid==false
          ?ListView.builder(
            itemCount: _products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
                child: InkWell(
                    splashColor: Colors.green,
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context)=> DisplayPage(id:_products[index].id,
                    title:_products[index].title,
                    image:_products[index].image,
                    qty:_products[index].rating?.count.toString(),
                    price:_products[index].price.toString(),
                    rating:_products[index].rating!.rate.toDouble(),
                    discription:_products[index].description,
                        )));
                  },
                  child: Card(
                    elevation: 3,
                    child: ListTile(
                      leading:Image.network(_products[index].image,
                      height: 180,
                      width: 150,) ,
                      title:Text(_products[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),) ,
                      subtitle: Column(
                        children: [
                          SizedBox(height: 10,),
                              Align(
                                alignment: Alignment.topLeft,
                                child: RatingBarIndicator(
                                    rating: _products[index].rating!.rate,
                                itemBuilder: (context,index)=>const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                itemCount: 5,
                                itemSize: 13.0,),
                              ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Text('\u{20B9}${_products[index].price}'),
                              Spacer(),
                              Text("x${_products[index].rating?.count}",textAlign: TextAlign.right,
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              );
              // return Column(
              //   children: [
              //     const SizedBox(
              //       height: 30,
              //     ),
              //     InkWell(
              //       child: Row(
              //         children: [
              //           Card(
              //             elevation: 3,
              //             color: Colors.white38,
              //             // margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
              //             shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(10),
              //             ),
              //             child: Center(
              //               child: InkWell(
              //                 onTap: (){
              //                   // int qt=_products[index].rating.count;
              //                   Navigator.of(context).push(MaterialPageRoute(
              //                     fullscreenDialog: true,
              //                       builder: (context)=> DisplayPage(id:_products[index].id,
              //                       title:_products[index].title,
              //                           image:_products[index].image,
              //                         qty:_products[index].rating?.count.toString(),
              //                         price:_products[index].price.toString(),
              //                         rating:_products[index].rating!.rate.toDouble(),
              //                         discription:_products[index].description,
              //                       )
              //                   ));
              //                 },
              //                 child: Hero(
              //                   tag: "$index",
              //                   child: Image.network(
              //                     _products[index].image,
              //                     height: 90,
              //                     width: 120,
              //                   ),
              //                 ),
              //               ),
              //             ),
              //             //         height: 150,
              //           ),
              //           Expanded(
              //             child: Card(
              //               elevation: 2,
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(_products[index].title,
              //                       style: const TextStyle(
              //                         fontWeight: FontWeight.bold,
              //                       )),
              //                   const SizedBox(
              //                     height: 30,
              //                   ),
              //                   Row(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     children: [
              //                       Expanded(
              //                           child: Text(
              //                         '\u{20B9}${_products[index].price}',
              //                         textAlign: TextAlign.left,
              //                       )),
              //                       Padding(
              //                         padding:
              //                             const EdgeInsets.fromLTRB(0, 0, 10, 0),
              //                         child: Text(
              //                           "x${_products[index].rating?.count}",
              //                           style: const TextStyle(
              //                             color: Colors.grey,
              //                           ),
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                   Row(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     children: [
              //                       Padding(
              //                         padding: const EdgeInsets.fromLTRB(0,0,0,6),
              //                         child: RatingBarIndicator(
              //                             rating:_products[index].rating!.rate,
              //                           itemBuilder: (context,index) => const Icon(
              //                             Icons.star,
              //                             color: Colors.yellow,
              //                           ),
              //                           itemCount: 5,
              //                           itemSize: 15.0,
              //                         ),
              //                       )
              //                       // Text(
              //                       //   "${_products[index].rating?.rate}",
              //                       //   style: const TextStyle(
              //                       //     color: Colors.grey,
              //                       //   ),
              //                       // ),
              //                     ],
              //                   )
              //                 ],
              //               ),
              //             ),
              //           ),
              //
              //         ],
              //       ),
              //     )
              //   ],
              // );
            })
            :GridView.builder(
          itemCount: _products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2
          ),
          itemBuilder: (_,index){
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                elevation: 10,
                child: Center(
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        fullscreenDialog: true,
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
                    child: Column(
                      children: [
                          Container(
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(_products[index].image),
                                fit: BoxFit.fitHeight
                              )
                            ),

                          ),
                        ListTile(
                          title: Text(_products[index].title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          maxLines: 1,),
                        ),
                        Row(
                          children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(9, 0, 0, 0),
                          child: Text(
                          '\u{20B9}${_products[index].price}',
                            textAlign: TextAlign.left,
                          ),
                        ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 9, 0),
                              child: Text('★ ${_products[index].rating?.rate}'),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home
              ),
          label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.shopping_cart
              ),
              label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.card_travel
              ),
              label: "Orders")
        ],
      ),

    );
  }
}

