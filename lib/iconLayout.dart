import 'package:flutter/material.dart';

const kLabelStyle = TextStyle(fontSize: 20.0, color: Colors.black);

class IconContent extends StatelessWidget {
  final IconData gender;
  final String text;

  IconContent(this.gender, this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            gender,
            size: 80.0,
            color: Colors.white,
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
