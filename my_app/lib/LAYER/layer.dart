import 'package:flutter/material.dart';
import 'colorBox.dart';

class Layer extends StatelessWidget {
  const Layer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layer Page'),
      ),
      body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                ColorBox(colors: Colors.purple),
                ColorBox(colors: Colors.green),
                ColorBox(colors: Colors.yellow),
              ColorBox(colors: Colors.orange),
              ColorBox(colors: Colors.red),
              ],
            ),
            ColorBox(colors: Colors.blue),

             Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              width: 150,
              height: 380,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle, color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Positioned(
              top: 50,
              child:Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.red,
                border: Border.all(color: Colors.white, width: 4),
            ),
            )),

            Positioned(
              top: 150,
              child:Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.yellow,
                border: Border.all(color: Colors.white, width: 4),
            ),
            )),

            Positioned(
              top: 250,
              child:Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.green,
                border: Border.all(color: Colors.white, width: 4),
            ),
            )),
          ],
        ),

          ],
        ),
    );
  }
}