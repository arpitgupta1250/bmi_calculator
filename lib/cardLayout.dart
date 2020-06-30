import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  final Color c;
  final Widget myChild;
  final Function onPressed;
  ReusableCard({this.c, this.myChild, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onPressed,
      child: Container(
          child: myChild,
          
          decoration: BoxDecoration(
            color: c,
            borderRadius: BorderRadius.circular(
                40.0), 
          ),
          height: MediaQuery.of(context).size.height*0.2,
          width: MediaQuery.of(context).size.width*0.4,
          margin: EdgeInsets.all(15.0),
        ),
    );
  }
}
