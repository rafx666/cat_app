import 'package:cat_app/login/login_page.dart';
import 'package:cat_app/login/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartPage extends StatelessWidget {
  const StartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/back.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                'CatApp',
                style: GoogleFonts.poppins(
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const CircleAvatar(
                backgroundImage: AssetImage('images/kotek1.png'),
                radius: 170,
              ),
              const SizedBox(
                height: 110,
              ),
              Container(
                  height: 60,
                  width: 270,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          color: Colors.black,
                          width: 3,
                          style: BorderStyle.solid),
                      bottom: BorderSide(
                          color: Colors.black,
                          width: 3,
                          style: BorderStyle.solid),
                      left: BorderSide(
                          color: Colors.black,
                          width: 3,
                          style: BorderStyle.solid),
                      right: BorderSide(
                          color: Colors.black,
                          width: 3,
                          style: BorderStyle.solid),
                    ),
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(
                        250,
                        60,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage(
                            'images/catpaw.png',
                          ),
                          width: 50,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'ZALOGUJ  SIĘ',
                          style: GoogleFonts.amaticSc(
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => LoginPage(),
                      ));
                    },
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: 270,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: Colors.black,
                        width: 3,
                        style: BorderStyle.solid),
                    bottom: BorderSide(
                        color: Colors.black,
                        width: 3,
                        style: BorderStyle.solid),
                    left: BorderSide(
                        color: Colors.black,
                        width: 3,
                        style: BorderStyle.solid),
                    right: BorderSide(
                        color: Colors.black,
                        width: 3,
                        style: BorderStyle.solid),
                  ),
                  color: Colors.white,
                ),
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size(
                      250,
                      60,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage(
                          'images/catpaw.png',
                        ),
                        width: 50,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'ZAREJESTRUJ  SIĘ',
                        style: GoogleFonts.amaticSc(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const SignInPage(),
                    ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
