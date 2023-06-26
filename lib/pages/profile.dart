import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dental_minor/widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  // final user = FirebaseAuth.instance.currentUser!;
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: CustomAppbar(
        title: 'Profile', automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Logged in.. as  ',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            IconButton(
                onPressed: () {
                  signUserOut();
                },
                icon: Icon(Icons.logout))
          ],
        ),
      ),
    );
  }
}
