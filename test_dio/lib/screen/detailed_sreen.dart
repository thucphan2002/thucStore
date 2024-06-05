import 'package:flutter/material.dart';

class DetailedScreen extends StatelessWidget {
  DetailedScreen(
      {super.key,
      this.images = '',
      this.titles = '',
      this.bodys = '',
      this.prices = ''});

  String images;
  String titles;
  String bodys;
  String prices;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(images),
          Text(
            titles,
            style: TextStyle(fontSize: 18, fontFamily: 'Times New Roman'),
          ),
          Text(
            bodys,
            style: TextStyle(fontSize: 14, fontFamily: 'Times New Roman'),
          ),
        ],
      ),
    );
  }
}
