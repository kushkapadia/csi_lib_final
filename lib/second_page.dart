import 'package:flutter/material.dart';
import 'package:csi_library/widgets/apptext.dart';
import 'package:csi_library/widgets/product_card.dart';
import 'package:csi_library/widgets/product_tile.dart';
import 'BookPage.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

int _currentIndex = 0;
List<ProductTile> productcards = [
  const ProductTile(
      image:
          'https://mir-s3-cdn-cf.behance.net/project_modules/1400/9d22a671392953.5bc4494680bce.jpg',
      genre: 'Management',
      author: 'Antonio Bonabeno',
      text: 'Show Your Work'),
  const ProductTile(
      image:
          'https://mir-s3-cdn-cf.behance.net/project_modules/1400/9d22a671392953.5bc4494680bce.jpg',
      genre: 'Art',
      author: 'Antonio Bonabeno',
      text: 'This is art'),
  const ProductTile(
      image:
          'https://mir-s3-cdn-cf.behance.net/project_modules/1400/9d22a671392953.5bc4494680bce.jpg',
      genre: 'Craft',
      author: 'Antonio Bonabeno',
      text: 'Show Your Work'),
  const ProductTile(
      image:
          'https://mir-s3-cdn-cf.behance.net/project_modules/1400/9d22a671392953.5bc4494680bce.jpg',
      genre: 'Management',
      author: 'Antonio Bonabeno',
      text: 'Show Your Work'),
];

List<String> menu = [
  'Popular',
  'Art',
  'Business',
  'Craft',
  'Design',
];
List<ProductTile> selectedProducts = [];
String selectedMenu = 'Popular';

List<ProductTile> getFilteredProductTiles(String menu) {
  if (menu == 'Popular') {
    return productcards;
  } else {
    return productcards.where((element) => element.genre == menu).toList();
  }
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height:  2.7/ 10 * MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                
                image: DecorationImage(
                  image: AssetImage('images/app_bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                           IconButton(
                            iconSize: 40,

                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            ),
                            
                          Center(child: const AppText(text: 'Menu')),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                     
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  // menu
                  Container(
                    height: 70,
                    child: ListView.builder(
                      itemCount: menu.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _currentIndex = index;
                                    selectedMenu = menu[_currentIndex];
                                  });
                                },
                                child: Text(
                                  menu[index],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: _currentIndex == index
                                        ? Colors.white
                                        : Colors.grey.shade400,
                                    fontFamily: 'PlayfairDisplay',
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(bottom: 2),
                                height: 5,
                                width: _currentIndex == index ? 20 : 0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: _currentIndex == index
                                      ? Colors.white
                                      : Colors.grey.shade400.withOpacity(0.1),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                        width: 8.5 / 10 * MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 222, 234, 246),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 10),
                            hintText: 'What would you like to read?',
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            prefixIcon: const Icon(Icons.search),
                            prefixIconColor: Colors.grey.shade800,
                          ),
                        ),
                        
                      ),
                      SizedBox(height: 30,),
                  Container(
                    height:  6.8/ 10 * MediaQuery.of(context).size.height,
                    decoration:
                        const BoxDecoration(color: Color.fromRGBO(42, 74, 193, 1)),
                    child: Container(
                      width: double.maxFinite,
                       height:  7/ 10 * MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Colors.white,
                      ),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: getFilteredProductTiles(selectedMenu).length,
                          itemBuilder: (context, index) {
                            List<ProductTile> selectedProducts =
                                getFilteredProductTiles(selectedMenu);
                            ProductTile productTile = selectedProducts[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        BookPage(productTile: productcards[index]),
                                  ),
                                );
                              },
                              child: ProductTile(
                                  image: productTile.image,
                                  genre: productTile.genre,
                                  author: productTile.author,
                                  text: productTile.text),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
