import 'package:flutter/material.dart';

class mappage extends StatefulWidget {
  const mappage({ Key? key }) : super(key: key);

  @override
  State<mappage> createState() => _mappageState();
}

class _mappageState extends State<mappage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("assets/map.jpg"),
      
    );
  }
}