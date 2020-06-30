
import 'dart:math';


class Brain {


  final int h;
  final int w;
  double _bmi = 0;

  Brain({this.h, this.w});

  String calculateBMI(){
    _bmi = w / pow(h * 0.0254, 2);
   return _bmi.toStringAsFixed(1);
  }



  String getInterpretation() {
    if(_bmi<18.5){
      return ' This BMI is considered underweight. Being underweight may pose certain health risks, including nutrient deficiencies and hormonal changes.';
    }
    else if(_bmi >=18.5 && _bmi <24.9){
      return ' This BMI is considered normal. Good job! ';
    }
    else if(_bmi >=25 && _bmi < 29.9){
      return ' This BMI is considered overweight. Being overweight may increase the risk of certain health conditions including cardiovascular diseases. Try exercising more!';
    }
    else{
      return ' This BMI is considered obese.A person should consult with their healthcare provider and consider making lifestyle changes through healthy eating and fitness to improve their health indicators.';
    }
  }



  String getResult() {
    if(_bmi<18.5){
      return 'UNDERWEIGHT';
    }
    else if(_bmi >=18.5 && _bmi <24.9){
      return 'NORMAL/HEALTHY';
    }
    else if(_bmi >=25 && _bmi < 29.9){
      return 'OVERWEIGHT';
    }
    else{
      return 'OBESE';
    }


  }


}