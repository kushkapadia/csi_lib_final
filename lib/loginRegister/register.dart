import 'package:flutter/material.dart';
import 'My_Textfield.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  @override
  final emailController = TextEditingController();
  final passController = TextEditingController();
  Widget build(BuildContext context) {
    String email = '';
    String pass = '';
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade800,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontFamily: 'PlayfairDisplay',
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Text(
                            'Register Here',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'PlayfairDisplay',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Expanded(
                child: MyTextField(
                  controller: emailController,
                  obscureText: false,
                  textHint: 'Email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.11),
                      blurRadius: 40,
                      spreadRadius: 0,
                    ),
                  ]),
                  child: TextField(
                    onChanged: (value) {
                      pass = value;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      prefixIconConstraints: const BoxConstraints(minWidth: 50),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue.shade800),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'homepage');
                    },
                    child: const Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'PlayfairDisplay',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text('Or continue with'),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 130, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade500),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'homepage');
                },
                child: Image.asset(
                  'images/googleimage.png',
                  height: 50,
                  width: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
