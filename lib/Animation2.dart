import 'package:flutter/material.dart';

class Animation2 extends StatefulWidget {
  @override
  _Animation2State createState() => _Animation2State();
}

class _Animation2State extends State<Animation2> with SingleTickerProviderStateMixin {

  Animation animation2;
  AnimationController animationController2;

  @override
  void initState() { 
    super.initState();
    animationController2 = AnimationController(vsync: this, duration: Duration(milliseconds: 2500));
    animation2 = Tween(begin: -1.0, end: 0.0 ).animate(CurvedAnimation(parent: animationController2, curve: Curves.fastOutSlowIn));
    animation2.addStatusListener(myListener);
    animationController2.forward();

  }

  void myListener(status) {
    if (status == AnimationStatus.completed){
      animation2.removeStatusListener(myListener);
      animationController2.reset();
      animation2 = Tween(begin: 0, end: 1.0 ).animate(CurvedAnimation(parent: animationController2, curve: Curves.fastOutSlowIn));
      animationController2.forward();
      Future.delayed(Duration(milliseconds: 2500),(){
        Navigator.pop(context);
      });
    }
  } 

  void getback(){
    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
    animationController2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("Animation App")),
      body: AnimatedBuilder(animation: animationController2, builder: (context,child){
        return Transform(
          transform: Matrix4.translationValues((animation2.value)*width, 0.0, 0.0),
            child: Center(
            child: Container(
              height: 100,
              width: 100,
              child: FlutterLogo(),

              )
          ),
        );
      }),
    );
  }
}