import 'package:csi_library/widgets/apptext.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 175,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(42, 74, 193, 1), 
            ),
            child: Row(
           
              children: [
                IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
                Container( margin : EdgeInsets.only(left: 65),child :AppText(text:'Your Profile'),),
              ],
            ),
          ),
              const SizedBox(height: 250,),
              Center(
             child : Container(
                 width: 150,
            height: 150,
             decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                    'https://cdn.dribbble.com/users/374672/screenshots/4016181/media/f8722787e4cb396b60416cab0ad55ce6.gif'), // Replace with your image URL
                fit: BoxFit.cover,
              ),
             ),
              ),
              ),
            
              const SizedBox(height: 45,),
              const AppText( text:'hi@gmail.com',color: Colors.black,size: 20,),
             // const SizedBox(height: 5,),
             // const Text('_______________________'),
              //  const SizedBox(height: 5,),
              const AppText(text: 'Name : Siro',size: 20,color: Colors.black,),
        ],
      ),
    );
  }
}