import 'package:aas/home.dart';
import 'package:aas/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class DetailPage extends StatelessWidget {

  final title,description,image,price,discount,rating,stock,brand,category;

  DetailPage({
    this.title="",
    this.description,
    this.image,
    this.price,
    this.discount,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Product",
        style: Bar),
        backgroundColor:const Color.fromRGBO(30, 35, 44, 1)
      ),
      body: ListView(
        children: <Widget>[
          ImageSlideshow(
            children: [
            for (var i = 0; i < image.length; i++)
              Container(
                  //margin: const EdgeInsets.only(top: 20.0, left: 20.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(image[i]),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),                                     
            ],
          ),
              Container(
                //margin: EdgeInsets.all(100),
                //height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0), color: Colors.grey
                ),
              ),  
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('$title',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold )
                ),
                Container(
                  padding: EdgeInsets.only(top: 15,bottom: 5),
                  child: Text("Detail Info  : ",
                  style: TextStyle(fontWeight: FontWeight.w600),),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5,bottom: 5),
                  child: Text('$description')),
                const Divider(color: Colors.grey),
                Container(
                  padding: const EdgeInsets.only(top: 5,bottom: 5),
                  child: Text("Price  : "+'$price'+" USD")),
                  const Divider(color: Colors.grey),
                Container(
                  padding: const EdgeInsets.only(top: 5,bottom: 5),
                  child: Text("Discount : "+'$discount'+"%")),
                  const Divider(color: Colors.grey),
                Container(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Text("Rating : "+'$rating')),
                  const Divider(color: Colors.grey),
                Container(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Text("Stock  : "+'$stock')),
                  const Divider(color: Colors.grey),
                Container(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Text("Brand  : "+'$brand')),
                  const Divider(color: Colors.grey),
                Container(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Text("Category : "+'$category')),
                  const Divider(color: Colors.grey),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(30, 35, 44, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))
                      ),
                      onPressed: (){
                        Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return HomePage();
                          }),
                      );
                    },
                    child: Text("Kembali",
                    style: login),
                  )),
                ), 
              ],  
            ),
          ),
        ],
      ),
    );
  }
}