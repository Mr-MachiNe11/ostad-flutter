import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ostad_flutter_assignments/model/product_model.dart';
import 'package:ostad_flutter_assignments/ui/photo_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductModel> productList = [];

  Future<List<ProductModel>> fetchData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        for (Map i in data) {
          productList.add(ProductModel.fromJson(i));
        }
        return productList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Failed to connect to the server');
    }
  }

  /*@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return ListView.builder(
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      final product = productList[index];
                      final thumbnailImg = product.thumbnailUrl;
                      final title = product.title;
                      return Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                        ),
                        child: ListTile(
                          leading: thumbnailImg != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  // Rounded corners
                                  child: Image.network(
                                    thumbnailImg,
                                    /* height: 48,
                                    width: 48,*/
                                  ),
                                )
                              : const CircleAvatar(
                                  child: Icon(Icons
                                      .person), // Default icon when thumbnailImg is null
                                ),
                          title: Text(title ?? 'unknown'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PhotoDetails(product: product),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
