import 'package:csi_library/widgets/apptext.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        backgroundColor: Colors.blue,
      ),
      body: ProfileBody(),
    );
  }
}

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 60,
            backgroundImage:
                AssetImage('assets/profile_picture.jpg'), // Add your image path
          ),
          SizedBox(height: 16.0),
          Text(
            'John Doe',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Library Enthusiast',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 24.0),
          Divider(),
          SizedBox(height: 16.0),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('john.doe@email.com'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('+1 (123) 456-7890'),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('123 Library Street, Cityville'),
          ),
          SizedBox(height: 16.0),
          Divider(),
          SizedBox(height: 16.0),
          Text(
            'Favorite Genres',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Chip(label: Text('Mystery')),
              Chip(label: Text('Fantasy')),
              Chip(label: Text('Science Fiction')),
            ],
          ),
          SizedBox(height: 24.0),
          TextButton(
            onPressed: () async {
              try {
                final googleSignIn = GoogleSignIn();
                await googleSignIn.signOut();
                Navigator.pushReplacementNamed(context, 'login');
              } catch (e) {
                print(e);
              }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            child: Text(
              'Log Out',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
