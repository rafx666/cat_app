import 'package:cat_app/app/login/cubit/login_page_cubit_cubit.dart';
import 'package:cat_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<LoginPage> {
  var isCreatingAccount = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginPageCubit()..start(),
      child: BlocBuilder<LoginPageCubit, LoginPageState>(
        builder: (context, state) {
          return Builder(builder: (context) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/back.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 28,
                          ),
                          Text(
                            'CatApp',
                            style: GoogleFonts.poppins(
                              fontSize: 45,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const CircleAvatar(
                            backgroundImage: AssetImage('images/kotek1.png'),
                            radius: 110,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            isCreatingAccount == false
                                ? 'Zaloguj się'
                                : 'Zarejestruj się',
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
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Hasło'),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            state.errorMessage,
                            style: const TextStyle(
                                fontSize: 17, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.brown,
                            ),
                            onPressed: () async {
                              if (isCreatingAccount == false) {
                                context.read<LoginPageCubit>().login(
                                    email: widget.emailController.text,
                                    password: widget.passwordController.text);
                                if (state.isLogged == true) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => const HomePage()));
                                }
                              } else {
                                context.read<LoginPageCubit>().signIn(
                                    email: widget.emailController.text,
                                    password: widget.passwordController.text);
                                if (state.isLogged == true) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => const HomePage()));
                                }
                              }
                            },
                            child: Text(
                              isCreatingAccount == false
                                  ? 'Zaloguj'
                                  : 'Utwórz konto',
                              style: const TextStyle(fontSize: 19),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.brown,
                            ),
                            onPressed: (() {
                              if (isCreatingAccount == true) {
                                setState(() {
                                  isCreatingAccount = false;
                                });
                              } else {
                                setState(() {
                                  isCreatingAccount = true;
                                });
                              }
                            }),
                            child: Text(
                              isCreatingAccount == false
                                  ? 'Nie masz konta?  Zarejestruj się!'
                                  : 'Masz juz konto?  Zaloguj się!',
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
