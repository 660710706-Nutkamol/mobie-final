import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberFormPage extends StatefulWidget {
  const NumberFormPage({super.key});

  @override
  State<NumberFormPage> createState() => _NumberFormPageState();
}

class _NumberFormPageState extends State<NumberFormPage> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  double? _result;

  void _calculateResult() {
    if (_formKey.currentState!.validate()) {
      final double num1 = double.parse(_num1Controller.text);
      final double num2 = double.parse(_num2Controller.text);

      setState(() {
        _result = num1 + num2; // 👉 ตัวอย่างนี้คำนวณผลรวม
      });
    }
  }

  @override
  void dispose() {
    _num1Controller.dispose();
    _num2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ฟอร์มคำนวณตัวเลข'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // ช่องกรอกเลขช่องที่ 1
              TextFormField(
                controller: _num1Controller,
                decoration: const InputDecoration(
                  labelText: 'ตัวเลขที่ 1',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณากรอกตัวเลขที่ 1';
                  }
                  if (double.tryParse(value) == null) {
                    return 'กรุณากรอกเป็นตัวเลขเท่านั้น';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              Text("บวก"),
              const SizedBox(height: 20),
              // ช่องกรอกเลขช่องที่ 2
              TextFormField(
                controller: _num2Controller,
                decoration: const InputDecoration(
                  labelText: 'ตัวเลขที่ 2',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณากรอกตัวเลขที่ 2';
                  }
                  if (double.tryParse(value) == null) {
                    return 'กรุณากรอกเป็นตัวเลขเท่านั้น';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // ปุ่ม Submit
              ElevatedButton(
                onPressed: _calculateResult,
                child: const Text('คำนวณ'),
              ),
              const SizedBox(height: 20),

              // แสดงผลลัพธ์
              if (_result != null)
                Text(
                  'ผลลัพธ์: $_result',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
