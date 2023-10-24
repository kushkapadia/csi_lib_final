 import 'package:csi_library/widgets/product_tile.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{

  final List<Map<String,dynamic>> cart=[
  
  ];
  void addBook(Map<String,dynamic> book){
    cart.add(book);
    notifyListeners();
  }
  void removeBook(Map<String,dynamic> book){
    cart.remove(book);
    notifyListeners();
  }
}