import 'package:csi_library/cart_provider.dart';
import 'package:csi_library/widgets/apptext.dart';
import 'package:csi_library/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  final  ProductTile? book;
  Cart({super.key,this.book});

  @override
  Widget build(BuildContext context) {
     List<Map<String, dynamic>> cart = Provider.of<CartProvider>(context).cart;
     CartProvider CP = Provider.of<CartProvider>(context,listen: false);

    return Consumer<CartProvider>(
      builder: (context,CartProvider,child){
      return
        Scaffold(
    
        body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 175,
            decoration: BoxDecoration(
              color: Color.fromRGBO(42, 74, 193, 1), 
            
            ),
           child: Row(
                   children: [
                     IconButton(
                      onPressed: (){
                        //  Navigator.pop(context);
                      }
                     , icon: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
                     Container(
                      margin: const EdgeInsets.only(left: 100),
                      child:   const AppText(text: 'Cart'),
                     ),
                    
                    
                   ],
                 ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context,index){
                  final CartItem = cart[index];
                  return ListTile(
                    leading:  CircleAvatar(
                   backgroundImage: NetworkImage(CartItem['image'].toString()),
                   radius: 55,
                    ),
                      title: Text (CartItem['title'].toString()),
                      subtitle: Text (CartItem['author'].toString() +" || " + CartItem['genre'].toString()),
                      
                      trailing: IconButton(
                        onPressed: (){
                          showDialog(context: context, builder: (context){
                                return  AlertDialog(
                                    title: const Text(
                                      'Remove BookMark',
                                      style:TextStyle(fontSize: 24,fontWeight: FontWeight.bold) ,
                                      ),
                                      content: const Text('Do you want to remove your BookMark?'),
                                      actions: [
                                        TextButton(
                                          onPressed: (){
                                          Navigator.of(context).pop();
                                        },
                                         child: Text('No',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                                         ),
                                        TextButton(onPressed: (){
                                       CP.removeBook(CartItem);
                                       Navigator.of(context).pop();
                                        },
                                         child: Text('Yes',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
                                         )),


                                      ],
                                );
                          });
                        },
                       icon: const Icon(Icons.delete,color: Colors.red,),
                       ),
                  );
            }
            ),
          ),
        ],
      ),
      );
      },
    );
  }
}