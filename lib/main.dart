import 'package:animations/ANimation2.dart';
import 'package:animations/Animation1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Animation App")),
        body: HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container( width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
      gradient: LinearGradient(colors: [Colors.blue, Colors.green], begin: Alignment.topLeft, end: Alignment.bottomRight)
                   ),
      child: Column( mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Animation1();
            }));
          }, child: Text("Animation 1"),color: Color(0xffF27516),colorBrightness: Brightness.dark,),
          RaisedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Animation2();
            }));
          }, child: Text("Animation 2"),color: Color(0xff2ECC71),colorBrightness: Brightness.dark,),
        ],
      ),
    );
  }
}