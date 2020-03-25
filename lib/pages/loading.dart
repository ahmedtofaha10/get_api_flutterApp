import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void getData() async {
    try {
      Response res = await get("https://jsonplaceholder.typicode.com/albums");
      List data = jsonDecode(res.body);
      Navigator.pushReplacementNamed(context, '/albums',arguments: {
        'albums' : data
      });
    } catch (e) {
      print("Exeption : $e");
      Navigator.pushNamed(context, '/error');
    }
   
  }
  void initState() {
    super.initState();
    getData();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
      body: Center(
        child:SpinKitPumpingHeart(
          color: Colors.white,
          size: 100.0,
        )
      ),
    );
  }
}