import 'dart:convert';
import 'package:http/http.dart' as http;
import 'product.dart';

class ApiService {
  final String baseUrl = 'http://127.0.0.1:8001';

  Future<List<Product>> getProducts() async {
    final response = await http.get(
      Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<void> createProduct(Product product) async {
    final response = await http.post(
      Uri.parse('$baseUrl/products'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(product.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create product');
    }
  }

  Future<void> updateProduct(int id, Product product) async {
    final response = await http.put(
      Uri.parse('$baseUrl/products/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(product.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update product');
    }
  }

  Future<void> deleteProduct(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/products/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete product');
    }
  }
}
