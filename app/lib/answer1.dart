import 'package:flutter/material.dart';

class Answer1 extends StatelessWidget {
  const Answer1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Comment Thread'),
      ),
      body: 
     // Center(
     //     child: 
      Container(
        width: 500,
        height: 180,
        color: const Color.fromARGB(255, 255, 255, 255),
        child:Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
            Container(
              alignment: Alignment.center,
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle , color: Colors.purpleAccent,
              ),
              child: Text("A"),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    Text("User A", style: TextStyle(fontWeight: FontWeight.bold),)
                ,
                    Text("This is the main comment. Flutter layouts are fun!")

                
              ],
            )
              ],
            ),

            SizedBox(
              height: 5,
            ),

            Row(
              children: [
                 Icon(Icons.thumb_up_alt_outlined, size: 18),
                  Text(' 12'),
                  SizedBox(width: 20),
                  Icon(Icons.comment_outlined, size: 18),
                  Text(' Reply'),
                  SizedBox(width: 230,),
                  Text('1h ago',style: TextStyle(color: Colors.grey),) 
              ],
            ),

            SizedBox(
              height: 10,
            ),

          Row(
  
              children: [
            SizedBox(width: 50,),

            Container(
              alignment: Alignment.center,
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle , color: const Color.fromARGB(255, 202, 199, 255),
              ),
              child: Text("B"),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    Text("User B", style: TextStyle(fontWeight: FontWeight.bold),)
                ,
                    Text("I agree")

                
              ],
            )
              ],
            ),

          ],
          
        ),
          ],
        ),
          
      ),
//        ) ,
    );
  }
}