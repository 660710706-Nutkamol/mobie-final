import 'package:flutter/material.dart';
import 'product.dart';
import 'api_service.dart';

class ProductFormPage extends StatefulWidget {
  final Product? product;
  const ProductFormPage({super.key, this.product});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  final ApiService api = ApiService();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _desc = TextEditingController();
  final TextEditingController _price = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      _name.text = widget.product!.name;
      _desc.text = widget.product!.description;
      _price.text = widget.product!.price.toString();
    }
  }

  void submit() async {
    if (_formKey.currentState!.validate()) {
      final product = Product(
        id: widget.product?.id ?? 0,
        name: _name.text,
        description: _desc.text,
        price: double.parse(_price.text),
      );
      try {
        if (widget.product == null) {
          await api.createProduct(product);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('เพิ่มสินค้าเรียบร้อย')));
        } else {
          await api.updateProduct(widget.product!.id, product);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('แก้ไขสินค้าเรียบร้อย')));
        }
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product == null ? 'เพิ่มสินค้า' : 'แก้ไขสินค้า')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(controller: _name, decoration: const InputDecoration(labelText: 'ชื่อสินค้า'), validator: (v) => v!.isEmpty ? 'กรุณากรอกชื่อ' : null),
              TextFormField(controller: _desc, decoration: const InputDecoration(labelText: 'รายละเอียด'), validator: (v) => v!.isEmpty ? 'กรุณากรอกรายละเอียด' : null),
              TextFormField(controller: _price, decoration: const InputDecoration(labelText: 'ราคา'), keyboardType: TextInputType.number, validator: (v) => v!.isEmpty ? 'กรุณากรอกราคา' : null),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: submit, child: const Text('บันทึก')),
            ],
          ),
        ),
      ),
    );
  }
}
