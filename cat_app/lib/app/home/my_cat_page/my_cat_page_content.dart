import 'package:cat_app/app/home/my_cat_page/cubit/my_cat_page_cubit.dart';
import 'package:cat_app/models/cat_model.dart';
import 'package:cat_app/repositories/cats_repository.dart';
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
      create: (context) => MyCatPageCubit(CatsRepository())..start(),
      child: BlocBuilder<MyCatPageCubit, MyCatPageState>(
        builder: (context, state) {
          final catModels = state.cats;
          if (state.errorMessage.isNotEmpty) {
            return Center(
              child: Text(
                'Something went wrong: ${state.errorMessage}',
              ),
            );
          }
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "images/back1.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: CatListView(
              catModels: catModels,
            ),
          );
        },
      ),
    );
  }
}

class CatListView extends StatelessWidget {
  const CatListView({
    Key? key,
    required this.catModels,
  }) : super(key: key);

  final List<CatModel> catModels;

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                  borderRadius: BorderRadius.circular(15), color: Colors.brown),
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
                    if (catModel.catAge.isNotEmpty) ...{
                      Text(
                        'Wiek: ${catModel.catAge}',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    },
                    if (catModel.catFood.isNotEmpty) ...{
                      Text(
                        'Co jadł: ${catModel.catFood}',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    },
                    if (catModel.vet.isNotEmpty) ...{
                      Text(
                        'Wet: ${catModel.vet}',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    },
                    if (catModel.others.isNotEmpty) ...{
                      Text(
                        'Uwagi: ${catModel.others}',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    },
                    Text(
                      'Data: ${catModel.catDate}',
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
