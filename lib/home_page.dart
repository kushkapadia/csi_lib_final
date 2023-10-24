import 'package:csi_library/books.dart';
import 'package:csi_library/cart.dart';
import 'package:csi_library/mainpage.dart';
import 'package:csi_library/profilepage.dart';
import 'package:csi_library/widgets/apptext.dart';
import 'package:csi_library/widgets/product_card.dart';
import 'package:csi_library/widgets/product_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentindex=0;

//  int currentindex=0;
final tabs=[  MainPage(),
Books(),
Cart(),
ProfilePage(),


];

  @override
  //rgb(65, 105, 225)
  Widget build(BuildContext context) {
    return  Scaffold(
    body: tabs[_currentindex],
      bottomNavigationBar:  
      BottomNavigationBar(
        currentIndex: _currentindex,
        onTap: (index){
            setState(() {
              _currentindex=index;
            });
        },
        selectedItemColor: Color.fromRGBO(42, 74, 193, 1),
        unselectedItemColor: Color.fromRGBO(42, 74, 193, 1).withOpacity(0.3),
        unselectedFontSize: 0,
        items: const  [
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            label: 'Home',
             ),

          BottomNavigationBarItem(
            icon:Icon(Icons.book),
            label: 'Book',
             ),

          BottomNavigationBarItem(
            icon:Icon(Icons.shopping_cart),
            label: 'Cart',
             ),

          BottomNavigationBarItem(
            icon:Icon(Icons.person),
            label: 'Profile',
             ),

        ],
        ),
      

      
    );
  }
}