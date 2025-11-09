import 'package:flutter/material.dart';

class Answer3 extends StatefulWidget {
  const Answer3({super.key});

  @override
  State<Answer3> createState() => _Answer3State();
}

class _Answer3State extends State<Answer3> {

    final _formKey = GlobalKey<FormState>();
    //   final TextEditingController _num1Controller = TextEditingController();
    //final TextEditingController _num2Controller = TextEditingController();
    int _basePrice = 150;
    int _servicePrice = 0;
    int _servicePrice2= 0;
    int _sumPrice = 0; 
    bool? isAccept1 = false;
    bool? isAccept2 = false;
    String? selectedCar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("คํานวณค่าบริการล้างรถ"),),
      body: Form(
        key: _formKey,
        child: Padding(padding: EdgeInsets.all(16.0),
        child:  Column(
        children: [
          
           DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'ขนาดรถ'),
              //value: selectedCar,
              items: ["รถเล็ก (Small) - 150 บาท", "รถเก๋ง (medium) - 200 บาท", "รถ SUV/กระบะ (Large) - 250 บาท"]
                  .map(
                    (String item) =>
                        DropdownMenuItem(value: item, child: Text(item)),
                  )
                  .toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedCar = value;
                  if(selectedCar=="รถเล็ก (Small) - 150 บาท"){
                    _basePrice = 150;
                  }else if(selectedCar=="รถเก๋ง (medium) - 200 บาท"){
                    _basePrice = 200;
                  }else if(selectedCar=="รถ SUV/กระบะ (Large) - 250 บาท"){
                    _basePrice = 250;
                  }
                  _sumPrice = _servicePrice + _basePrice + _servicePrice;
                });
              },
              validator: (String? value) {
                if (value == null) {
                  return "Please select Car";
                }
                return null;
              },
            ),
            SizedBox(height: 20,),
              CheckboxListTile(
              title: const Text('ดูดฝุ่น (+50บาท)'),
              value: isAccept1,
              onChanged: (bool? value) {
                setState(() {
                  isAccept1 = value;
                  if(isAccept1 == true){
                    _servicePrice = 50;
                  }else{
                    _servicePrice = 0;
                  }
                  _sumPrice = _servicePrice + _basePrice + _servicePrice2;
                });
              },
            ),

            SizedBox(height: 20,),
              CheckboxListTile(
              title: const Text('เคลือบแว็กซ (+100บาท)' ),
              value: isAccept2,
              onChanged: (bool? value) {
                setState(() {
                  isAccept2 = value;
                  if(isAccept2 == true){
                    _servicePrice2 = 100;
                  }else{
                    _servicePrice2 = 0;
                  }
                  _sumPrice = _servicePrice + _basePrice + _servicePrice2;
                });
              },
            ),

            SizedBox(height: 20,),
            Text("ราคารวม $_sumPrice")
        ],
      )),
       ),
    );
  }
}