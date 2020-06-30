import 'package:bmi_calculator/results.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bottom.dart';
import 'cardLayout.dart';
import 'function.dart';
import 'iconLayout.dart';
import 'results.dart';

const initialCardColor = Colors.amberAccent;

const finalCardColor = Colors.lightGreen;
const kNumStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.w800,
  color: Colors.white,
);

enum Gender { M, F }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender;
  int height = 60;
  int weight = 60;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.white,
              fontSize: 25,letterSpacing: 2),
        ),
        centerTitle: true,

        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.amberAccent  
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.97,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: ReusableCard(
                      c: gender == Gender.M ? finalCardColor : initialCardColor,
                      myChild: IconContent(FontAwesomeIcons.mars, 'MALE'),
                      onPressed: () {
                        setState(() {
                          gender = Gender.M;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ReusableCard(
                      c: gender == Gender.F ? finalCardColor : initialCardColor,
                      myChild: IconContent(FontAwesomeIcons.venus, 'FEMALE'),
                      onPressed: () {
                        setState(() {
                          gender = Gender.F;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    color: initialCardColor,
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'HEIGHT',
                        style: kLabelStyle,
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: kNumStyle,
                          ),
                          Text(
                            'in',
                            style: kLabelStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbColor: Colors.white,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          activeTrackColor: Colors.white,
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                          overlayColor: Colors.lightGreen
                        ),
                        child: Slider(
                            value: height.toDouble(),
                            inactiveColor: Colors.black12,
                            min: 40,
                            max: 85,
                            onChanged: (double newVal) {
                              setState(() {
                                height = newVal.round();
                              });
                            }),
                      )
                    ],
                  ))),
          Expanded(
            flex: 1,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.97,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: ReusableCard(
                        c: initialCardColor,
                        myChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('WEIGHT', style: kLabelStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(
                                  weight.toString(),
                                  style: kNumStyle,
                                ),
                                Text(
                                  'kg',
                                  style: kLabelStyle,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Button(
                                  icon: FontAwesomeIcons.minus,
                                  press: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Button(
                                  icon: FontAwesomeIcons.plus,
                                  press: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                )
                              ],
                            ),
                          ],
                        )),
                  ),
                  Expanded(
                    flex: 1,
                    child: ReusableCard(
                        c: initialCardColor,
                        myChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'AGE',
                              style: kLabelStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Button(
                                  icon: FontAwesomeIcons.minus,
                                  press: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Button(
                                  icon: FontAwesomeIcons.plus,
                                  press: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                )
                              ],
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            onTap: () {
              Brain calculation = Brain(h: height, w: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Results(
                          bmiNum: calculation.calculateBMI(),
                          resText: calculation.getResult(),
                          bmiInterpret: calculation.getInterpretation(),
                        )),
              );
            },
            title: 'CALCULATE',
          )
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  final IconData icon;
  final Function press;
  Button({this.icon, this.press});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: press,
      child: Icon(
        icon,
        color: Colors.white,
      ),
      constraints: BoxConstraints.tightFor(
        width: MediaQuery.of(context).size.width * 0.12,
        height: MediaQuery.of(context).size.height * 0.055,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      fillColor: Colors.orange,
    );
  }
}
