// final List<Map<String,dynamic>> cart =[
//   //image,genre,author,text;
//   {
//     'image':  'https://mir-s3-cdn-cf.behance.net/project_modules/1400/9d22a671392953.5bc4494680bce.jpg',
//     'genre':  'Art',
//     'author': 'Gesalt' ,
//     'title':   'This is Art',
//   }
// ];
 // child: StreamBuilder<QuerySnapshot>(
                  //   stream: FirebaseFirestore.instance
                  //       .collection('books')
                  //       .snapshots(),
                  //   builder: (BuildContext context,
                  //       AsyncSnapshot<QuerySnapshot> snapshot) {
                  //     if (snapshot.hasError) {
                  //       return Text('Something went wrong');
                  //     }

                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       return CircularProgressIndicator(); // Show a loading indicator while waiting
                  //     }
                  //     if (snapshot.hasData) {
                  //       print(snapshot.data);
                  //     }

                  //     // Assuming the data you're interested in is in a field named 'products'
                  //     List<ProductTile> products =
                  //         snapshot.data!.docs.map((DocumentSnapshot document) {

                  //       Map<String, dynamic> data =
                  //           document.data() as Map<String, dynamic>;
                  //       //print("helooooo" + data['text']);

                  //       return ProductTile(
                  //         image: data['image'],
                  //         genre: "test",
                  //         text: data['text'],
                  //         author: data['author'],
                  //         // ... and so on for other fields
                  //       );
                  //     }).toList();