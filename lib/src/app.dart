import 'package:flutter/material.dart';
import './screens/news_list.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News',
      home: NewsList(),
    );
  }
}
