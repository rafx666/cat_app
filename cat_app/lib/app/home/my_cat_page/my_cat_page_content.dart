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
          final catModels = state.cats;
          if (state.errorMessage.isNotEmpty) {
            return Center(
                child: Text('Something went wrong: ${state.errorMessage}'));
          }
          if (catModels.isEmpty) {
            return Center(child: Text(state.cats.isEmpty.toString()));
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
                for (final catModel in catModels) ...[
                  Dismissible(
                    key: ValueKey(catModel.id),
                    onDismissed: (_) {
                      context.read<MyCatPageCubit>().delete(catModel.id);
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
                                  catModel.catName,
                                  style: const TextStyle(
                                      fontSize: 22, color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            if (catModel.catAge.isEmpty == false)
                              Text(
                                'Wiek: ${catModel.catAge}',
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            if (catModel.catAge.isEmpty == false)
                              const SizedBox(
                                height: 5,
                              ),
                            if (catModel.catFood.isEmpty == false)
                              Text(
                                'Co jadł: ${catModel.catFood}',
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            if (catModel.catFood.isEmpty == false)
                              const SizedBox(
                                height: 5,
                              ),
                            if (catModel.vet.isEmpty == false)
                              Text(
                                'Wet: ${catModel.vet}',
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            if (catModel.vet.isEmpty == false)
                              const SizedBox(
                                height: 5,
                              ),
                            if (catModel.others.isEmpty == false)
                              Text(
                                'Uwagi: ${catModel.others}',
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            if (catModel.others.isEmpty == false)
                              const SizedBox(
                                height: 5,
                              ),
                            Text(
                              'Data: ${catModel.catDate}',
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
