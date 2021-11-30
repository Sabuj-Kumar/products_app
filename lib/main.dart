import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Model/product_model.dart';
import 'ShowDescription/product_description.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Products Item',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Product List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<ProductModel>> loadData() async {
    var json = await rootBundle.loadString("assets/product.json");
    var productData = jsonDecode(json);
    var products = List.from(productData)
        .map<ProductModel>((item) => ProductModel.fromJson(item))
        .toList();
    return products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFe5e5e5),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder<List<ProductModel>>(
            future: loadData(),
            builder: (BuildContext context,
                AsyncSnapshot<List<ProductModel>> snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                    ),
                    itemBuilder: (context, index) =>
                        Data(data: snapshot.data![index]));
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}

class Data extends StatelessWidget {
  const Data({Key? key, required this.data}) : super(key: key);

  final ProductModel data;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      child: Expanded(
        child: Card(
          child: ListView(
            children: [
              Text("Title : ${data.title!}"),
              Image.network(
                data.image!,
                width: width / 2 - 2,
                height: height / 7 - 2,
              ),
              Text("Price : ${data.price!.toString()}")
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDescription(productDetail: data)));
      },
    );
  }
}
