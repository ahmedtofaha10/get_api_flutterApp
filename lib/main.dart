import 'package:flutter/material.dart';
import 'package:json_api/pages/loading.dart';
import 'package:json_api/pages/albums.dart';
import 'package:json_api/pages/photos.dart';
import 'package:json_api/pages/error.dart';
void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/'       : (context) => Loading(),
    '/albums' : (context) => Albums(),
    '/photos' : (context) => Photos(),
    '/error' : (context) => Error(),
  },
));
