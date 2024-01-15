import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ostad_flutter_assignments/button/primary_button.dart';

void showMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}



void showAddToCartDialog(BuildContext context,String itemName, int quantity) {
  AlertDialog alert = AlertDialog(
    content: Builder(
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Congratulations!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  const Text('You have added'),
                  Text('$quantity'),
                  Text('$itemName to your bag!'),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              PrimaryButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                title: 'OKAY',
              ),
            ],
          ),
        );
      },
    ),
  );
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
