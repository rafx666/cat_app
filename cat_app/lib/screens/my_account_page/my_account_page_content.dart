import 'package:cat_app/screens/default_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyAccountPageContent extends StatelessWidget {
  const MyAccountPageContent({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final DefaultPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Text('Jesteś zalogowany jako ${widget.user.email}'),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
              ),
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
    );
  }
}
