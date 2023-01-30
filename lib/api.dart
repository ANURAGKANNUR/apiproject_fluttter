// import 'package:apiproject_fluttter/product%20model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'details.dart';
import 'navigation drawer.dart';
import 'product model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';

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
      const CircularProgressIndicator();
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
              ?const Icon(Icons.list,color: Colors.white,)
              :const Icon(Icons.grid_view,color: Colors.white,),
          )
        ],
      ),
      body: isGrid==false
        ?ListView.builder(
          itemCount: _products.length,
          itemBuilder: (context, index) {
            return Column(
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
                          child: Hero(
                            tag: "$index",
                            child: Image.network(
                              _products[index].image,
                              height: 90,
                              width: 120,
                            ),
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
            );
          })
          :GridView.builder(
        itemCount: _products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
        ),
        itemBuilder: (_,index){
          return Padding(
            padding: EdgeInsets.all(10),
            child: Card(
              elevation: 8,
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
                        style: TextStyle(
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
                          Spacer(),
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
      )
    );
  }
}

