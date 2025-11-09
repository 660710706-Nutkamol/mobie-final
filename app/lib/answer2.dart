//import 'dart:ffi';

import 'package:flutter/material.dart';

class Answer2 extends StatelessWidget {
  const Answer2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Concert Ticket"),),
      body: Center(
        child: Container(
          width: 300,
          height: 180,
          decoration: BoxDecoration(
             color: Colors.blueGrey.shade100, borderRadius: BorderRadius.circular(15) 
          ),
        child: Row(
          children: [
            SizedBox(width: 20,),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 15,),
                  Text('Flutter Live' , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  Text('Band: The Widgets'),
                  Text('Date: 8 NOV 2025'),
                  Text('Gate: 7'),
                  SizedBox(height: 15,),
                ],
              )),
              Stack(
                children: [
                  Positioned(
                    // left: 210,
                    child:  
                    Icon(Icons.more_vert, color: Colors.white)
                  )
                ],
              ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                color: const Color.fromARGB(255, 68, 86, 95),
                child:  Icon(Icons.qr_code, color: Colors.white, size: 50),
              )),
              
          ],
        ),
        ),
      ),
    );
  }
}