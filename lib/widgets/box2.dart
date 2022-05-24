import 'package:flutter/material.dart';

class Box2 extends StatelessWidget {
  const Box2(
      {required this.ageLabel,
      required this.age,
      required this.iconsAdd,
      required this.iconsRem,
      required this.addVal,
      required this.remVal});

  final String ageLabel;
  final String age;
  final IconData iconsAdd;
  final IconData iconsRem;
  final VoidCallback addVal;
  final VoidCallback remVal;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(35),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 184, 184, 181),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(ageLabel,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),
          Text(age,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: addVal,
                child: Icon(
                  iconsAdd,
                  size: 40,
                ),
              ),
              GestureDetector(
                onTap: remVal,
                child: Icon(
                  iconsRem,
                  size: 40,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
