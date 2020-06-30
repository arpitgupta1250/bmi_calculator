import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String title;
  BottomButton({this.onTap, this.title});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.amberAccent
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 27.0),
            ),
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.09,
        width: double.infinity,
        margin: EdgeInsets.all(15.0),
      ),
    );
  }
}
