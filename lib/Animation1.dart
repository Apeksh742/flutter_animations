import 'package:flutter/material.dart';

class Animation1 extends StatefulWidget {
  @override
  _Animation1State createState() => _Animation1State();
}

class _Animation1State extends State<Animation1> with SingleTickerProviderStateMixin {

  Animation animation1;
  AnimationController animationController1;

  @override
  void initState() {
    super.initState();
    animationController1 = AnimationController(vsync: this, duration: Duration(milliseconds: 3500));
    animation1 = CurvedAnimation(parent: animationController1, curve: Curves.bounceInOut);
    animation1.addListener(() {
      setState(() {
        print(animation1.value);
      });
    });
    animation1.addStatusListener((status) {
      if(status == AnimationStatus.completed)
       animationController1.reverse();

      if (status == AnimationStatus.dismissed){
        Navigator.pop(context);
      }
    });
    animationController1.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(title: Text("Animation App")),
        body: Center(
          child: Container(
          width: (animation1.value*100)+50,
          height: (animation1.value*100)+50,
          child: FlutterLogo(),
          
      ),
        ),
    );
  }
}