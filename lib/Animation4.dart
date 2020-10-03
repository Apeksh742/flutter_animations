import 'package:flutter/material.dart';

class Animation4 extends StatefulWidget {
  @override
  _Animation4State createState() => _Animation4State();
}

class _Animation4State extends State<Animation4> with TickerProviderStateMixin {

  Animation animation4;
  AnimationController animationController4;

  @override
  void initState() { 
    super.initState();
    animationController4 = AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation4 = CurvedAnimation(parent: animationController4, curve: Curves.elasticInOut);

    animationController4.forward();

    animation4.addStatusListener((status) {
      if(status == AnimationStatus.completed)
       animationController4.reverse();
      if (status == AnimationStatus.dismissed)
       Navigator.pop(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text("Animation App")),
       body: Center(
         child: RotationTransition(turns: animationController4,child: FlutterLogo(size: 100,),)
       ),
    );
  }
}