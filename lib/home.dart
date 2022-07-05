//@dart=2.9
import 'dart:convert';

import 'package:aas/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aas/detail_page.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _get = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product",
        style: Bar),
        backgroundColor:Color.fromRGBO(30, 35, 44, 1)
      ),
    
      body: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2 
                            ),
                            itemCount: _get.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: (){
                                  Navigator.push(
                                  context, MaterialPageRoute(
                                    builder: (c) => DetailPage(
                                        title: _get[index]['title'],
                                        description: _get[index]['description'],
                                        image: _get[index]['images'],
                                        price: _get[index]['price'] as int,
                                        discount: _get[index]['discountPercentage'],
                                        rating: _get[index]['rating'],
                                        stock: _get[index]['stock'],
                                        brand: _get[index]['brand'],
                                        category: _get[index]['category']
                                      )));
                                },
                                child: Card(
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(
                                        child: _get[index]['thumbnail'] != null
                                        ? Image.network(
                                          _get[index]['thumbnail'],
                                          fit: BoxFit.cover,
                                        )
                                        :Center()
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 10, bottom: 10),
                                        child: Text('${_get[index]['title']}',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },  
                          ),
          );
  }
  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
          "https://dummyjson.com/products"));
      // return jsonDecode(response.body);

      if (response.statusCode == 200) {
        print(response.body);
        final data = jsonDecode(response.body);
        setState(() {
          _get = data['products'];
        });
      }
    } catch (e) {
      print(e);
    }
  }
}