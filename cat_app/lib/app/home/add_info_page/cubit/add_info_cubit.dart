// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'add_info_state.dart';

class AddInfoCubit extends Cubit<AddInfoState> {
  AddInfoCubit() : super(AddInfoState());

  Future<void> add({
    required catName,
    required age,
    required catFood,
    required vet,
    required others,
    required data,
  }) async {
    FirebaseFirestore.instance.collection('cat_info').add({
      'cat_name': catName,
      'age': age,
      'cat_food': catFood,
      'vet': vet,
      'others': others,
      'data': data,
    });
  }
}
