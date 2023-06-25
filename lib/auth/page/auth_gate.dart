import 'package:do_not_forget/home_page/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<auth.User?>(
      stream: auth.FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            subtitleBuilder: (context, action) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: Text(
                  action == AuthAction.signIn
                      ? 'Welcome to App "DO NOT FORGET"! Please sign in to continue.'
                      : 'Welcome to App "DO NOT FORGET"! Please create an account to continue',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              );
            },
            footerBuilder: (context, _) {
              return const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  'By signing in, you agree to our terms and conditions.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              );
            },
            providers: [
              EmailAuthProvider(),
            ],
          );
        }
        return const HomePage();
      },
    );
  }
}
