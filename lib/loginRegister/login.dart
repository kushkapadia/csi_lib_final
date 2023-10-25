import 'package:csi_library/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'My_Textfield.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    if (_isValid()) {
      try {
        
        print("calledddddddddd");
        await Auth().signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
        Navigator.pushReplacementNamed(context, 'homepage');
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'An error occurred')),
        );
      }
    }
  }

  bool _isValid() {
    bool validEmail = _emailController.text.contains(
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}"));
    bool validPassword = _passwordController
        .text.isNotEmpty; // You can add more password rules here

    if (!validEmail) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid email')),
      );
    }

    if (!validPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password cannot be empty')),
      );
    }

    return validEmail && validPassword;
  }

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
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _passwordController,
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
                onPressed: signInWithEmailAndPassword,
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
               onPressed: () async {
  try {
     final googleSignIn = GoogleSignIn();
       await googleSignIn.signOut();
    final googleSignInAccount = await GoogleSignIn().signIn();

    if (googleSignInAccount != null) {
      final googleSignInAuthentication = await googleSignInAccount.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

          Navigator.pushReplacementNamed(context, 'homepage');
    } else {
      // User cancelled the sign-in process
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign-in cancelled by user')),
      );
    }
  } catch (error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error signing in: $error')),
    );
  }
},

              ),
            ],
          ),
        ),
      ),
    );
  }
}
