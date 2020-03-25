import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
class Albums extends StatefulWidget {
  @override
  _AlbumsState createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {
  @override
  Map data = {};
  List albums = []; 
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    albums = data["albums"];
    return Scaffold(
      backgroundColor: Colors.blue[500],
      appBar: AppBar(
        title:Text("Albums"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue[900],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children:
              albums.map((album)=>Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      height: 100,
                      width:350,
                      child: FlatButton(
                        onPressed: () async {
                          try {
                            Response res = await get("https://jsonplaceholder.typicode.com/albums/${album['id']}/photos");
                            List photos = jsonDecode(res.body);
                            Navigator.pushNamed(context,'/photos',arguments: {
                              'title':album['title'],
                              'photos':photos
                            });
                          } catch (e) {
                            Navigator.pushNamed(context,'/error');
                          }
                          
                        },
                        child: Text(
                          "${album['title']}",
                          style: TextStyle(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.w400,
                            letterSpacing: 2.5,
                            fontSize:15,
                          ),
                          ),
                      ),
                      color: Colors.white,
                    ),
                  ),
                ],
              )).toList()
            ,
          ),
        ),
      ),
    );
  }
}