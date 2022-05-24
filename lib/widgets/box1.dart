import 'package:bmi_calc/constant/constants.dart';
import 'package:flutter/material.dart';

class Box1 extends StatelessWidget {
  final Icon iconName;
  final String gender;
  final Color boxColor;
  final VoidCallback selectGender;
  final double paddingBox = 10;
  final double radiusCircular = 10;

  const Box1(
      {Key? key,
      required this.iconName,
      required this.gender,
      required this.boxColor,
      required this.selectGender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(paddingBox),
      decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.all(Radius.circular(radiusCircular))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(onTap: selectGender, child: iconName),
          Text(gender, style: styleLabel1)
        ],
      ),
    );
  }
}
