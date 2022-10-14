import 'package:cat_app/appbar/cat_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DefaultPage extends StatelessWidget {
  const DefaultPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(45),
        child: CatBar(),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/back1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('strona startowa'),
              Text('Jesteś zalogowany jako ${user.email}'),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: const Text(
                  'Wyloguj',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
