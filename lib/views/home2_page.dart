import 'package:flutter/material.dart';
import 'package:flutter_tutorial/helpers/constants.dart';

class Home1Page extends StatefulWidget {
  const Home1Page({super.key});

  @override
  State<Home1Page> createState() => _Home1PageState();
}

class _Home1PageState extends State<Home1Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home2"),),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
        children: [
          Text("data")
        ],
        ),
      ),
    );
  }
}
