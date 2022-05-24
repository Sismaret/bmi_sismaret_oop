import 'package:bmi_calc/constant/constants.dart';
import 'package:bmi_calc/repository/body.dart';
import 'package:bmi_calc/repository/gender.dart';
import 'package:bmi_calc/services/bmi_services.dart';
import 'package:bmi_calc/view/view_result.dart';
import 'package:bmi_calc/widgets/box1.dart';
import 'package:bmi_calc/widgets/box2.dart';
import 'package:bmi_calc/widgets/box3.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(backgroundColor: const Color.fromRGBO(50, 4, 77, 0.89)),
      home: const MyHomePage(
        title: 'BMI Calculator',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Init Value
  double _sliderValue = 0;
  int _height = 0;
  bool _isMale = true;
  int _weight = 60;
  int _age = 30;
  int score = 0;
  String result = '';
  String interpretation = '';

  //Function BMI Calculation
  void bmiCalc(_weight, _height) {
    BmiServices bmiServ = BmiServices(weight: _weight, height: _height);
    score = bmiServ.getScore();
    result = bmiServ.getResult(score);
    interpretation = bmiServ.getInterpretation(score);
  }

  //Set gender
  void selectGender(gender genderInput) {
    setState(() {
      if (genderInput == gender.male) {
        _isMale = true;
      } else {
        _isMale = false;
      }
    });
  }

  //Adjust Value age and weight
  void adjustValue(int val, body bodiInput, String operation) {
    switch (bodiInput) {
      case body.age:
        setState(() {
          if (operation == 'add') {
            val++;
            _age = val;
          } else {
            val--;
            _age = val;
          }
        });
        break;
      case body.weight:
        setState(() {
          if (operation == 'add') {
            val++;
            _weight = val;
          } else {
            val--;
            _weight = val;
          }
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: colorBackground,
        shadowColor: shadowColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: marginBox,
                ),
                Expanded(
                    flex: 1,
                    child: Box1(
                        iconName: const Icon(
                          Icons.male_sharp,
                          size: sizeIconMenu,
                        ),
                        gender: 'Male',
                        boxColor: _isMale ? colorBoxActive : colorBoxInactive,
                        selectGender: () {
                          selectGender(gender.male);
                        })),
                const SizedBox(
                  width: marginBox,
                ),
                Expanded(
                    flex: 1,
                    child: Box1(
                        iconName: const Icon(
                          Icons.female_sharp,
                          size: sizeIconMenu,
                        ),
                        gender: 'Female',
                        boxColor: !_isMale ? colorBoxActive : colorBoxInactive,
                        selectGender: () {
                          selectGender(gender.female);
                        })),
                const SizedBox(
                  width: marginBox,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: marginSection,
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Box3(
                    height: _height,
                    widget: Slider(
                      min: 0,
                      max: 300,
                      divisions: 300,
                      activeColor: Colors.greenAccent,
                      inactiveColor: Colors.grey,
                      value: _sliderValue,
                      onChanged: (double val) {
                        setState(() {
                          _sliderValue = val;
                          _height = _sliderValue.toInt();
                        });
                      },
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: marginSection,
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: marginBox,
                ),
                Expanded(
                    flex: 2,
                    child: Box2(
                        ageLabel: 'Weight',
                        age: _weight.toString(),
                        iconsAdd: Icons.add_circle_rounded,
                        iconsRem: Icons.remove_circle_rounded,
                        addVal: () {
                          adjustValue(_weight, body.weight, 'add');
                        },
                        remVal: () {
                          adjustValue(_weight, body.weight, 'minus');
                        })),
                const SizedBox(
                  width: marginBox,
                ),
                Expanded(
                    flex: 2,
                    child: Box2(
                        ageLabel: 'Age',
                        age: _age.toString(),
                        iconsAdd: Icons.add_circle_rounded,
                        iconsRem: Icons.remove_circle_rounded,
                        addVal: () {
                          adjustValue(_age, body.age, 'add');
                        },
                        remVal: () {
                          adjustValue(_age, body.age, 'minus');
                        })),
                const SizedBox(
                  width: marginBox,
                )
              ],
            ),
          ),
          const SizedBox(
            height: marginSection,
          ),
        ],
      ),
      backgroundColor: colorBackground,
      bottomNavigationBar: GestureDetector(
        onTap: () {
          BmiServices bmiServ = BmiServices(weight: _weight, height: _height);
          score = bmiServ.getScore();
          result = bmiServ.getResult(score);
          interpretation = bmiServ.getInterpretation(score);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ViewResult(result, score.toDouble(), interpretation)));
        },
        child: Container(
          height: 55,
          decoration: const BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'PROCEED',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
