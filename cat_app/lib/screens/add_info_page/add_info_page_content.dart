import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddInfoPageContent extends StatefulWidget {
  const AddInfoPageContent({
    Key? key,
    required this.onSave,
  }) : super(key: key);
  final Function onSave;

  @override
  State<AddInfoPageContent> createState() => _AddInfoPageContentState();
}

class _AddInfoPageContentState extends State<AddInfoPageContent> {
  var catName = '';
  var catFood = '';
  var vet = '';
  var age = '';
  var others = '';
  var data = '';

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
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Imię kota',
                  fillColor: Colors.white,
                  filled: true,
                ),
                onChanged: (newValue) {
                  setState(
                    () {
                      catName = newValue;
                    },
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Wiek',
                  fillColor: Colors.white,
                  filled: true,
                ),
                onChanged: (newValue) {
                  setState(
                    () {
                      age = newValue;
                    },
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Co jadł?',
                  fillColor: Colors.white,
                  filled: true,
                ),
                onChanged: (newValue) {
                  setState(
                    () {
                      catFood = newValue;
                    },
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Weterynarz?',
                  fillColor: Colors.white,
                  filled: true,
                ),
                onChanged: (newValue) {
                  setState(
                    () {
                      vet = newValue;
                    },
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Uwagi',
                  fillColor: Colors.white,
                  filled: true,
                ),
                onChanged: (newValue) {
                  setState(
                    () {
                      others = newValue;
                    },
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Data',
                  fillColor: Colors.white,
                  filled: true,
                ),
                onChanged: (newValue) {
                  setState(
                    () {
                      data = newValue;
                    },
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                ),
                onPressed: catName.isEmpty || data.isEmpty
                    ? null
                    : () {
                        FirebaseFirestore.instance.collection('cat_info').add({
                          'cat_name': catName,
                          'age': age,
                          'cat_food': catFood,
                          'vet': vet,
                          'others': others,
                          'data': data,
                        });
                        widget.onSave();
                      },
                child: const Text(
                  'Dodaj',
                  style: TextStyle(
                    fontSize: 19,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
