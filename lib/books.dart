import 'package:csi_library/widgets/apptext.dart';
import 'package:flutter/material.dart';

class Books extends StatelessWidget {
  const Books({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Container(
        child :Column(
          children: [
             Container(
            width: double.infinity,
            height: 175,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(42, 74, 193, 1), 
            ),
             ),
             const AppText(text: 'Dummy Page',color: Colors.black,size: 24,),
          ],
          )
      ),
    );
  }
}