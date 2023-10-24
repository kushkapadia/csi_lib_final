import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String genre;
  final String title;
  const ProductCard(
      {super.key,
      required this.image,
      required this.genre,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         

        Navigator.pushNamed(context, 'secondpage');
      },
      child: Card(
        margin: const EdgeInsets.only(left: 20),
        child: Container(
          height: 200,
          width: 225,
          //decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.network(image, width: 225, fit: BoxFit.cover),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    genre,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
