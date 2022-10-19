import 'package:flutter/material.dart';

class AddInfoPageContent extends StatelessWidget {
  const AddInfoPageContent({
    Key? key,
  }) : super(key: key);

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
          children: const [
            Text('strona dodaj'),
          ],
        ),
      ),
    );
  }
}
