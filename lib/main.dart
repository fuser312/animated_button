import 'package:flutter/material.dart';

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

class _AnimatedButtonState extends State<AnimatedButton> {

bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleVisible,
      child: Container(
          width: 150,
          height: 150,
          color: Colors.grey.shade900,
        child: AnimatedOpacity(
          duration: Duration(milliseconds:500),
          opacity: isVisible ? 1 : 0,
          child: Icon(
            Icons.location_on,
            color: Colors.white,
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
