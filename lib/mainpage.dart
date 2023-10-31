import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:csi_library/widgets/apptext.dart';
import 'package:csi_library/widgets/product_card.dart';
import 'package:csi_library/widgets/product_tile.dart';
import 'BookPage.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var tempList;
  final CollectionReference _books =
      FirebaseFirestore.instance.collection('books');
  List<ProductTile> searchResults = [];
  String isSearch = "";
  int _currentIndex = 0;
  List<ProductTile> allproducts = [];
  List<ProductCard> products = [
    const ProductCard(
        image:
            'https://mir-s3-cdn-cf.behance.net/project_modules/1400/9d22a671392953.5bc4494680bce.jpg',
        genre: 'Artiyguyig',
        title: 'Gestalt'),
    const ProductCard(
        image:
            'https://mir-s3-cdn-cf.behance.net/project_modules/max_3840/c249ad111184009.5ffd5f54b941c.jpg',
        genre: 'Design',
        title: 'Modern Design'),
    const ProductCard(
        image:
            'https://mir-s3-cdn-cf.behance.net/project_modules/1400/53a65b87950467.5dc7ecdd7ce48.jpg',
        genre: 'Science',
        title: 'Astrology'),
  ];

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

  // Future<List<ProductTile>> getItems() async {
  //   print("Called");
  //   final response = await http.get(
  //     Uri.parse(
  //         "https://firestore.googleapis.com/v1/projects/csi-lib-app/databases/(default)/documents/books"),
  //   );

  //   if (response.statusCode >= 400) {
  //     throw Exception('Failed To load data');
  //   }
  //   if (response.body == 'null') {
  //     return [];
  //   }

  //   Map<String, dynamic> data = jsonDecode(response.body);
  //   List<ProductTile> tempList = [];
  //   print(data);
  //   // for (final val in data.entries) {
  //   //   tempList.add(
  //   //     ProductTile(
  //   //       image: val[fields],
  //   //       genre: val.value['name'],
  //   //       author: val.value['quantity'],
  //   //       text:
  //   //     ),
  //   //   );
  //   // }
  //   return tempList;
  // }

  void initState() {
    setState(() {
      
    tempList = getItems();
    });
    super.initState();
  }

  Future<List<ProductTile>> getItems() async {
    final response = await http.get(Uri.parse(
        'https://csi-lib-app-default-rtdb.firebaseio.com/books.json'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data.values.first);
    }
    if (response.statusCode >= 400) {
      throw Exception('Failed To load data');
    }
    if (response.body == 'null') {
      return [];
    }

    Map<String, dynamic> data = jsonDecode(response.body);
    List<ProductTile> tempList = [];

    for (final val in data.values) {
      print(val['genre']);
      tempList.add(
        ProductTile(
            genre: val['genre'],
            author: val['author'],
            image: val['image'],
            text: val['title']),
      );
    }

    return tempList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 3.5 / 5 * MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/app_bg.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      const AppText(text: 'Litereasy'),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'secondpage');
                        },
                        child: Container(
                          width: 9 / 10 * MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                isSearch = value.toString();
                                 searchResults = filterProducts(value);
                              });
                             
                              print(value);
                            },
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: const Color.fromRGBO(33, 64, 181, 1),
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 10),
                              hintText: 'What would you like to read?',
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                              prefixIcon: const Icon(Icons.search),
                              prefixIconColor: Colors.grey.shade400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AppText(
                          text: 'New Collection',
                          size: 24,
                        ),
                        Icon(
                          Icons.menu,
                          color: Colors.grey.shade400,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      child: ListView.builder(
                          itemCount: products.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            ProductCard product = products[index];
                            return ProductCard(
                              image: product.image,
                              genre: product.genre,
                              title: product.title,
                            );
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // menu
                  Expanded(
                    child: Container(
                      height: 100,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: menu.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _currentIndex = index;
                                      selectedMenu = menu[_currentIndex];
                                      // Navigator.pushNamed(context, 'secondpage');
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
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
              child: Container(
                decoration: const BoxDecoration(),
                child: Container(
                  width: double.maxFinite,
                  height: 250,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: FutureBuilder<List<ProductTile>>(
  future: getItems(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Center(child: Text("Error fetching data"));
    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return Center(child: Text("No data available"));
    } else {
      return ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          ProductTile productTile = snapshot.data![index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookPage(productTile: productTile),
                ),
              );
            },
            child: ProductTile(
              image: productTile.image,
              genre: productTile.genre,
              author: productTile.author,
              text: productTile.text,
            ),
          );
        },
      );
    }
  },
)


                          return 
                          isSearch.isEmpty? ListView.builder(
                            itemCount: isSearch == ""
                                ? snapshot.data!.docs.length
                                : searchResults.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> products =
                                  snapshot.data!.docs[index].data()
                                      as Map<String, dynamic>;
                              print(products['title']);

                              ProductTile productTile = ProductTile(
                                image: products['image'],
                                genre: products['genre'],
                                author: products['author'],
                                text: products['title'],
                              );
                              allproducts.add(productTile);
                              print(allproducts);
                              {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            BookPage(productTile: productTile),
                                      ),
                                    );
                                  },
                                  child: isSearch == ""
                                      ? ProductTile(
                                          image: products['image'],
                                          genre: products['genre'],
                                          author: products['author'],
                                          text: products['title'],
                                        )
                                      : searchResults[index],
                                );
                              }
                            },
                          ):ListView.builder(
                            itemCount: isSearch == ""
                                ? snapshot.data!.docs.length
                                : searchResults.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> products =
                                  snapshot.data!.docs[index].data()
                                      as Map<String, dynamic>;
                              print(products['title']);

                              ProductTile productTile = ProductTile(
                                image: products['image'],
                                genre: products['genre'],
                                author: products['author'],
                                text: products['title'],
                              );
                              allproducts.add(productTile);
                              print(allproducts);
                              {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            BookPage(productTile: productTile),
                                      ),
                                    );
                                  },
                                  child: isSearch == ""
                                      ? ProductTile(
                                          image: products['image'],
                                          genre: products['genre'],
                                          author: products['author'],
                                          text: products['title'],
                                        )
                                      : searchResults[index],
                                );
                              }
                            },
                          );
                        } else {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('No Data'),
                              ),
                            );
                          });
                          return Center();
                        }
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
                  ),


                  //     Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Container(
                  //         height: 200,
                  //         child: ListView.builder(
                  //           itemCount: products.length,
                  //           scrollDirection: Axis.horizontal,
                  //           itemBuilder: (context, index) {
                  //             ProductTile product = products[index];
                  //             return ProductTile(
                  //               image: product.image,
                  //               genre: product.genre,
                  //               author: product.author,
                  //               text: product.text,
                  //             );
                  //           },
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // List<ProductTile> filterProduct(String enteredKeyword) {
  //   List<ProductTile> results = [];
  //   String keyword = enteredKeyword.toLowerCase().trim();
  //   print(enteredKeyword);

  //   if (enteredKeyword.isEmpty) {
  //     print("inside empty");
  //     // print(products);
  //     print(results);
  //     return allproducts;
  //   } else {
  //     results = allproducts
  //         .where((element) =>
  //             element.text.trim().toLowerCase().contains(keyword))
  //         .toList();

  //     print(results);
  //     // print(products);
  //     print("inside else");

  //     print(results);
  //     return results;
  //   }
  // }
  // List<ProductTile> filterProducts(String enteredKeyword) {
  //   List<ProductTile> results = [];
  //   String keyword = enteredKeyword.toLowerCase().trim();

  //   if (enteredKeyword.isEmpty) {
  //     return allproducts; // Show all products when the search keyword is empty
  //   } else {
  //     results = allproducts.where((element) {
  //       // You can use different conditions here based on your requirements
  //       String productName = element.text.toLowerCase();
  //       print("rohit");
  //       print(productName);
  //       return productName.contains(keyword);
  //     }).toList();

  //     return results;
  //   }
  // }
  List<ProductTile> filterProducts(String enteredKeyword) {
    String keyword = enteredKeyword.toLowerCase().trim();
    List<ProductTile> results = [];

    if (enteredKeyword.isEmpty) {
<<<<<<< HEAD
      return allproducts; // Show all products when the search keyword is empty
=======
      print("inside empty");
      // print(allproducts);
      return allproducts;
>>>>>>> 845eeb51c40faf01cf138023047fe6da75d7f4a8
    } else {
      return allproducts
          .where(
              (element) => element.text.toLowerCase().contains(keyword))
          .toList();
<<<<<<< HEAD
=======

      // print(results);
      // print(products);
      print("inside else");
      // print(results);
      return results;
>>>>>>> 845eeb51c40faf01cf138023047fe6da75d7f4a8
    }
  }
}
