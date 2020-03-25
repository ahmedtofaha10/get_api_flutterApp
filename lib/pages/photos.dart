import 'package:flutter/material.dart';

class Photos extends StatefulWidget {
  @override
  _PhotosState createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  Map data;
  List photos;
  String title;
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    title = data['title'];
    photos = data['photos'];
    return Scaffold(
      appBar: AppBar(
        title:Text("$title"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue[900],
      ),
      body: Center(
        child:SingleChildScrollView(
          child: Column(
            children: photos.map((p)=>
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 350,
                  child: Column(
                    children: <Widget>[
                      Text(
                        '${p["title"]}',
                        style: TextStyle(
                          color:Colors.blue[800],
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      SizedBox(height: 10,),
                      Image.network('${p['url']}',width: 350,height: 350),
                      Divider(height: 30,color: Colors.blue[900],)
                    ],
                  ),
                ),
              ) ,
            ).toList(),
          )  
        )
      ),
    );
  }
}