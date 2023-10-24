import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'My_Textfield.dart';

// class MyLogin extends StatefulWidget {
//   const MyLogin({Key? key}) : super(key: key);

//   @override
//   State<MyLogin> createState() => ();
// }

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 15),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: Text('Login'),
                onPressed: () {
                  Navigator.pushNamed(context, 'homepage');
                },
              ),
              SizedBox(height: 15),
              Text(
                'OR',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              ElevatedButton.icon(
                icon: Image.asset(
                  'images/googleimage.png',
                  height: 24,
                ),
                label: Text('Sign in with Google'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 15),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: () {
                  GoogleSignIn().signIn();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
