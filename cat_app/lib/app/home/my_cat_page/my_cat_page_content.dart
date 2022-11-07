import 'package:cat_app/app/home/my_cat_page/cubit/my_cat_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCatPageContent extends StatefulWidget {
  const MyCatPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<MyCatPageContent> createState() => _MyCatPageContentState();
}

class _MyCatPageContentState extends State<MyCatPageContent> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyCatPageCubit()..start(),
      child: BlocBuilder<MyCatPageCubit, MyCatPageState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return Center(
                child: Text('Something went wrong: ${state.errorMessage}'));
          }
          if (state.isLoading == true) {
            return const Center(child: CircularProgressIndicator());
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
                for (final document in state.documents) ...[
                  Dismissible(
                    key: ValueKey(document.id),
                    background: const DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 32.0),
                          child: Icon(
                            Icons.delete,
                          ),
                        ),
                      ),
                    ),
                    confirmDismiss: (direction) async {
                      // only from right to left
                      return direction == DismissDirection.endToStart;
                    },
                    onDismissed: (direction) {
                      context.read<MyCatPageCubit>().delete(document.id);
                    },
                    child: Container(
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
                            if (document['age'].toString().isEmpty == false)
                              const SizedBox(
                                height: 5,
                              ),
                            if (document['cat_food'].toString().isEmpty ==
                                false)
                              Text(
                                'Co jadł: ${document['cat_food']}',
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            if (document['cat_food'].toString().isEmpty ==
                                false)
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
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
