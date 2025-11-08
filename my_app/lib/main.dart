import 'package:flutter/material.dart';
//import 'LAYER/layer.dart';
//import 'from/pass.dart';
import 'api/product_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: const ProductListPage(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => FirstPage(),
        //'/second': (context) => SecondPage()
      //},
    );
  }
}