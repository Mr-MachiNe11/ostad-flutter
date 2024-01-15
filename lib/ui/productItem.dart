import 'package:flutter/material.dart';
import 'package:ostad_flutter_assignments/model/product_model.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  final int qty;
  final double totalAmount;
  final Function() onAdd;
  final Function() onRemove;

  const ProductItem({super.key,
    required this.product,
    required this.qty,
    required this.totalAmount,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    double productPrice = product.price * qty;
    double screenWidth = MediaQuery.of(context).size.width;

    double imageWidth = screenWidth * 0.3;
    double itemHeight = screenWidth * 0.4;
    double fontSizeTitle = screenWidth * 0.05;
    double fontSizeSubtitle = screenWidth * 0.03;
    double fontSizePrice = screenWidth * 0.05;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.red, width: 3),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: itemHeight,
                color: Colors.grey.withOpacity(0.3),
                child: Image.network(product.image, width: imageWidth),
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                height: itemHeight,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: TextStyle(
                              fontSize: fontSizeTitle,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              const Text(
                                "Color: ",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                product.color,
                                style: TextStyle(
                                  fontSize: fontSizeSubtitle,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Size: ",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                product.size,
                                style: TextStyle(
                                  fontSize: fontSizeSubtitle,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: onAdd,
                                child: const CircleAvatar(
                                  backgroundColor: Colors.red,
                                  maxRadius: 15,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Text(
                                  qty.toString(),
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: onRemove,
                                child: const CircleAvatar(
                                  backgroundColor: Colors.red,
                                  maxRadius: 15,
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon:
                              const Icon(Icons.more_vert_outlined)),
                          Text(
                            '\$$productPrice',
                            style: TextStyle(
                              fontSize: fontSizePrice,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

