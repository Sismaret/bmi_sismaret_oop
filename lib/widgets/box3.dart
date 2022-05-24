import 'package:flutter/material.dart';

class Box3 extends StatelessWidget {
  const Box3({required this.height, required this.widget});

  final int height;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        width: 370,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 184, 184, 181),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Height',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  height.toStringAsFixed(2),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 21),
                ),
                const Text('cm')
              ],
            ),
            widget,
          ],
        ));
  }
}
