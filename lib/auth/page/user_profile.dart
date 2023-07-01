import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 3, 253, 241),
          size: 28,
        ),
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Color.fromARGB(255, 3, 253, 241),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(MediaQuery.of(context).size.width, 80.0),
          ),
        ),
        toolbarHeight: 120,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(129, 41, 37, 37),
      ),
      providers: [
        EmailAuthProvider(),
      ],
      actions: [
        SignedOutAction(
          (context) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'You have been logged out !!!',
                  style: TextStyle(
                    color: Color.fromARGB(255, 3, 253, 241),
                    fontSize: 18,
                  ),
                ),
                backgroundColor: Color.fromARGB(129, 41, 37, 37),
                padding: EdgeInsets.all(20),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        ),
      ],
      avatarSize: 80,
    );
  }
}
