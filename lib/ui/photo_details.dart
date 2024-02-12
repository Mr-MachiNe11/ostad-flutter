import 'package:flutter/material.dart';
import 'package:ostad_flutter_assignments/model/product_model.dart';

class PhotoDetails extends StatefulWidget {
  final ProductModel product;

  const PhotoDetails({super.key, required this.product});

  @override
  State<PhotoDetails> createState() => _PhotoDetailsState();
}

class _PhotoDetailsState extends State<PhotoDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Details'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.network(
              widget.product.url ?? '', // Use the full-size image URL
              width: 400,
              height: 400,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                child: Text(
                  'Title: ${widget.product.title ?? 'Unknown'}',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              Text('ID: ${widget.product.id ?? 'Unknown'}',
                  style: const TextStyle(fontSize: 18)),
            ],
          ),
        ],
      ),
    );
  }
}
