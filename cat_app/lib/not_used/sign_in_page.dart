// ignore_for_file: unused_import

import 'package:cat_app/appbar/cat_bar.dart';
import 'package:cat_app/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  SignInPage({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var errorMessage = '';

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
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Zarejestruj się',
                  style: GoogleFonts.poppins(
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: widget.emailController,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'E-mail'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: widget.passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      filled: true, fillColor: Colors.white, hintText: 'Hasło'),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  errorMessage,
                  style: const TextStyle(fontSize: 17, color: Colors.black),
                ),
                const SizedBox(
                  height: 7,
                ),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.brown),
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: widget.emailController.text,
                              password: widget.passwordController.text);
                      if (!mounted) return;
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const HomePage()));
                    } catch (error) {
                      setState(() {
                        errorMessage = 'Niepoprawny e-mail';
                      });
                    }
                  },
                  child: const Text(
                    'Utwórz konto',
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
