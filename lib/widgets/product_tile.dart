import 'package:csi_library/BookPage.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatefulWidget {
  final String image,genre,author,text;

   const ProductTile({super.key, required this.image, required this.genre, required this.author, required this.text});

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
       margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Expanded(
            child:  Container(
             // margin: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
              child:ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                    child:  Image.network(widget.image,width: 100,height: 100,),
              )
                  
          ),
          ),
          
      Expanded(
         child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(widget.genre,style: const TextStyle(fontSize: 16),),
              Text(widget.text,style: const TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold),),
              Text(widget.author,style: const TextStyle(fontSize: 12),),
    
    
            ],
          ),
      ),
    
        Padding(
          padding: const EdgeInsets.only(left: 10),
            child: IconButton(
              onPressed: (){
            //     Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => BookPage(productTile: ProductTile,)),
            // );
            }, 
            icon: const Icon(Icons.arrow_forward_ios)),
        ),
          
    
        ],
    
      ),
    );
  }
}