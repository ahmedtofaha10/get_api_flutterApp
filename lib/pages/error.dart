import 'package:flutter/material.dart';
class Error extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Network Error",
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 40,
                  fontFamily: 'tahoma',
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}