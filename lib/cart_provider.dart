import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csi_library/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];
  // final CollectionReference cartCollection = FirebaseFirestore.instance.collection('cart');


  void addBook(Map<String, dynamic> book) async {
    // cartCollection.add(book).then((value) {
    //   print('Book added to cart in Firebase successfully');
    // }).catchError((error) {
    //   print('Failed to add book to cart in Firebase: $error');
    // });

      final Uri endpoint =
        Uri.parse('https://csi-lib-app-default-rtdb.firebaseio.com/cart.json');
    final response = await http.post(
      endpoint,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(book),
    );
     print('Book added to cart in Firebase successfully');
  
    cart.add(book);
    notifyListeners();
  }

  void removeBook(Map<String, dynamic> book) async{
    String title = book[
        'title']; // Assuming 'title' is the unique identifier for the book in the cart
    // cartCollection.where('title', isEqualTo: title).get().then((snapshot) {
    //   if (snapshot.size > 0) {
    //     snapshot.docs.first.reference.delete().then((value) {
    //       print('Book removed from cart in Firebase successfully');
    //     }).catchError((error) {
    //       print('Failed to remove book from cart in Firebase: $error');
    //     });
    //   }
    // });

    //     final Uri endpoint =
    //     Uri.parse('https://csi-lib-app-default-rtdb.firebaseio.com/cart.json');
    // final response = await http.delete(
    //   endpoint,
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body: jsonEncode(book),
    // );
    cart.remove(book);
    notifyListeners();
  }
}
