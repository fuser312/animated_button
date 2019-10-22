import 'package:flutter/material.dart';

//

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Center(
        child: AnimatedButton(),
      ),
    );
  }
}

class AnimatedButton extends StatefulWidget {
  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation<double> animation;

bool isVisible = true;
  @override
  void initState(){
    controller = AnimationController(
      duration: Duration(milliseconds : 800),
      vsync: this
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceInOut);
    controller.addStatusListener((AnimationStatus status){
      if(status == AnimationStatus.completed){
        controller.reverse();
      }
      else if(status == AnimationStatus.completed){
        controller.forward();
      }
      print ("Status is now $status");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    CurvedAnimation smmothAnimation = CurvedAnimation(parent: controller, curve: Curves.decelerate)
    return GestureDetector(
      onTap: controller.forward,
      child: Container(
          width: 150,
          height: 150,
          color: Colors.grey.shade900,
        child: ScaleTransition(
          scale: Tween(begin: 1.0, end: 3.0).animate(controller),
          child: Icon(
            Icons.favorite,
            color: Colors.red,
            size: 60,
          ),
        ),
      ),
    );
  }

  void toggleVisible() {
    print('Button clicked');
    setState(() {
      if(isVisible){
        isVisible = false;
      }
      else{
        isVisible =true;
      }
    });
  }
}
