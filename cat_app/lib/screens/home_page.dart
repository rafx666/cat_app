// ignore_for_file: unused_import

import 'package:cat_app/appbar/cat_bar.dart';
import 'package:cat_app/screens/default_page.dart';
import 'package:cat_app/screens/start_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        final user = snapshot.data;
        if (user == null) {
          return const StartPage();
        }
        return DefaultPage(user: user);
      },
    );
  }
}
