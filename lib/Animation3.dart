

import 'dart:math';

import 'package:flutter/material.dart';

class Animation3 extends StatefulWidget {
  @override
  _Animation3State createState() => _Animation3State();
}

class _Animation3State extends State<Animation3> {
  var _width = 100.0;
  var _height = 100.0;
  Color _color = Color(0xff76D7C4 );
  var _borderRadius = BorderRadius.circular(5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animation App")),
      body: Center(
      child: AnimatedContainer(duration: Duration(seconds: 1),
       width: _width,
       height: _height,
       curve: Curves.fastOutSlowIn,
       decoration: BoxDecoration(
         borderRadius: _borderRadius,
         color: _color,
       ),
      
      ),
     ),
     floatingActionButton: FloatingActionButton(onPressed: (){
       setState(() {   
         _width = Random().nextInt(350).toDouble();
         _height = Random().nextInt(350).toDouble();
         _color = Colors.primaries[Random().nextInt(15)];
         _borderRadius = BorderRadius.circular(Random().nextInt(20).toDouble());
       },
       );
     },
     child: Icon(Icons.play_arrow),
     ),
    );

  }
}