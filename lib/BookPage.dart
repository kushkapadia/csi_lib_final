import 'package:csi_library/cart_provider.dart';
import 'package:csi_library/mainpage.dart';
import 'package:csi_library/widgets/apptext.dart';
import 'package:csi_library/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:provider/provider.dart';


class BookPage extends StatefulWidget {
  final ProductTile productTile;
  const BookPage({super.key, required this.productTile});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Expanded(
              child: Container(
                height: 30,
                width: 30,
                child: GestureDetector(
                  onTap: () {
                    print('hii');
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 175,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(42, 74, 193, 1),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                      Container(
                        margin: EdgeInsets.only(left: 100),
                        child: Center(child: AppText(text: 'Menu')),
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  child: Image.network(
                    widget.productTile.image,
                    fit: BoxFit.cover,
                    height: 225,
                    width: 225,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        AppText(
          text: widget.productTile.text,
          color: Colors.black,
          size: 20,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          widget.productTile.author,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Icon(
              Icons.star_half,
              color: Colors.amber,
            ),
          ],
        ),
        // Container(height: 20,width:100,color: Colors.green,),
        const SizedBox(
          height: 25,
        ),

        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                AppText(
                  text: '130',
                  color: Colors.black,
                  size: 20,
                ),
                Text(
                  'Pages',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text(
                '|',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w100,
                  color: Colors.black,
                ),
              ),
            ),
            Column(
              children: [

                AppText(
                  text: 'English',
                  color: Colors.black,
                  size: 20,
                ),
                Text(
                  'Language',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text(
                '|',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w100,
                  color: Colors.black,
                ),
              ),
            ),
            Column(
              children: [
                AppText(
                  text: '2018',
                  color: Colors.black,
                  size: 20,
                ),
                Text(
                  'Release',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                )
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: Container(
            height: 100,
            width: 300,
            child: Column(
              children: [
                Text(
                  lorem(paragraphs: 1, words: 20),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        ElevatedButton(
      onPressed: (){
        Provider.of<CartProvider>(context, listen: false).addBook({
          'image':widget.productTile.image,
          'genre':widget.productTile.genre,
          'author':widget.productTile.author,
          'title':widget.productTile.text,
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product Added succesfully')),
        );
    },
     style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green),fixedSize: MaterialStatePropertyAll(Size(225, 50),),),
     child: const AppText(text: 'Bookmark',size: 20,),
     ),

       
      ]
     ),

    );
  }
}
// class Bookmark extends StatefulWidget {
//   const Bookmark({super.key});

//   @override
//   State<Bookmark> createState() => _BookmarkState();
// }

// class _BookmarkState extends State<Bookmark> {
//    bool isAdded = false;
//   @override
//   Widget build(BuildContext context) {
//     return  ElevatedButton(
//       onPressed: (){
//         setState(() {
//           isAdded=!isAdded;
//         });
//     },
//      style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green),fixedSize: MaterialStatePropertyAll(Size(225, 50),),),
//      child: isAdded? const Icon(Icons.done):const AppText(text: 'Bookmark',size: 20,),
//      );
//   }
// }