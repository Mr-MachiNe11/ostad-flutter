import 'package:flutter/material.dart';
import 'package:ostad_flutter_assignments/button/primary_button.dart';
import 'package:ostad_flutter_assignments/constants/constants.dart';
import 'package:ostad_flutter_assignments/model/product_model.dart';
import 'package:ostad_flutter_assignments/ui/productItem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, int> quantities = {};

  double get totalAmount {
    double total = 0;
    for (var entry in quantities.entries) {
      ProductModel product = productList.firstWhere(
            (p) => p.name == entry.key,
      );
      total += product.price * entry.value;
    }
    return total;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'My Bag',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                ProductModel product = productList[index];
                String productName = product.name;

                if (!quantities.containsKey(productName)) {
                  quantities[productName] = 1;
                }

                int qty = quantities[productName]!;

                return ProductItem(
                  product: product,
                  qty: qty,
                  totalAmount: totalAmount,
                  onAdd: () {
                    setState(() {
                      quantities[productName] = qty + 1;
                    });
                    if (qty + 1 == 5) {
                      showAddToCartDialog(context, productName, qty + 1);
                    }

                  },
                  onRemove: () {
                    if (qty > 0) {
                      setState(() {
                        quantities[productName] = qty - 1;
                      });

                    }
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total amount: ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                Text(
                  '\$$totalAmount',
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, bottom: 8.0),
            child: PrimaryButton(
              title: 'CHECK OUT',
              onPressed: () {
                showMessage('Congratulations!');
              },
            ),
          ),
        ],
      ),
    );
  }


}

final productList = [
  ProductModel(
    name: "Pullover",
    size: "L",
    price: 51,
    image:
    "https://www.pngmart.com/files/23/Black-Sweatshirt-PNG-HD-Isolated.png",
    color: "Black",
  ),
  ProductModel(
    name: "T-Shirt",
    size: "L",
    price: 30,
    image: "https://www.pngmart.com/files/22/Oversized-T-Shirt-PNG.png",
    color: "Grey",
  ),
  ProductModel(
    name: "Sport Dress",
    size: "M",
    price: 43,
    image:
    "https://static.vecteezy.com/system/resources/thumbnails/022/917/150/small/black-sport-t-shirt-with-abstract-pattern-blank-t-shirt-mockup-template-free-png.png",
    color: "Black",
  ),
];

