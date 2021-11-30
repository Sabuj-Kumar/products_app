import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:products_app/Model/product_model.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({Key? key, required this.productDetail})
      : super(key: key);

  final ProductModel productDetail;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        leading: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              alignment: Alignment.centerLeft,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Back",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 10),
            )),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  productDetail.title!,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Image.network(
                  productDetail.image!,
                  width: width / 3.0,
                  height: height / 4.0,
                ),
              ),
              Center(
                child: Text(productDetail.description!,
                    style: TextStyle(fontSize: 15, color: Colors.black)),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(productDetail.price.toString()),
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.all(10),
                    ));
                  },
                  child: Text(
                    "Buy",
                    textAlign: TextAlign.left,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
