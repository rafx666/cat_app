import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyCatPageContent extends StatefulWidget {
  const MyCatPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<MyCatPageContent> createState() => _MyCatPageContentState();
}

class _MyCatPageContentState extends State<MyCatPageContent> {
  final scaf = 2;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('cat_info')
          .orderBy('data', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Text('Waiting for data'));
        }
        final documents = snapshot.data!.docs;
        if (scaf == 1) {
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
                  Text('mój kot'),
                ],
              ),
            ),
          );
        }
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/back1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: [
              for (final document in documents) ...[
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.brown),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              document['cat_name'],
                              style: const TextStyle(
                                  fontSize: 22, color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        if (document['age'].toString().isEmpty == false)
                          Text(
                            'Wiek: ${document['age']}',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                        const SizedBox(
                          height: 5,
                        ),
                        if (document['cat_food'].toString().isEmpty == false)
                          Text(
                            'Co jadł: ${document['cat_food']}',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                        if (document['cat_food'].toString().isEmpty == false)
                          const SizedBox(
                            height: 5,
                          ),
                        if (document['vet'].toString().isEmpty == false)
                          Text(
                            'Wet: ${document['vet']}',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                        if (document['vet'].toString().isEmpty == false)
                          const SizedBox(
                            height: 5,
                          ),
                        if (document['others'].toString().isEmpty == false)
                          Text(
                            'Uwagi: ${document['others']}',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                        if (document['others'].toString().isEmpty == false)
                          const SizedBox(
                            height: 5,
                          ),
                        Text(
                          'Data: ${document['data']}',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
