 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csi_library/widgets/product_tile.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{

  final List<Map<String,dynamic>> cart=[
  
  ];
  final CollectionReference cartCollection = FirebaseFirestore.instance.collection('cart');

void addBook(Map<String, dynamic> book) {
  cartCollection.add(book).then((value) {
    print('Book added to cart in Firebase successfully');
  }).catchError((error) {
    print('Failed to add book to cart in Firebase: $error');
  });
  cart.add(book);
  notifyListeners();
}
void removeBook(Map<String, dynamic> book) {
  String title = book['title']; // Assuming 'title' is the unique identifier for the book in the cart
  cartCollection.where('title', isEqualTo: title).get().then((snapshot) {
    if (snapshot.size > 0) {
      snapshot.docs.first.reference.delete().then((value) {
        print('Book removed from cart in Firebase successfully');
      }).catchError((error) {
        print('Failed to remove book from cart in Firebase: $error');
      });
    }
  });
  cart.remove(book);
  notifyListeners();
}
}