import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cat_app/models/cat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'my_cat_page_state.dart';

class MyCatPageCubit extends Cubit<MyCatPageState> {
  MyCatPageCubit()
      : super(
          const MyCatPageState(
            cats: [],
            isLoading: false,
            errorMessage: '',
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> delete(documentID) async {
    FirebaseFirestore.instance.collection("cat_info").doc(documentID).delete();
  }

  Future<void> start() async {
    emit(
      const MyCatPageState(
        cats: [],
        isLoading: true,
        errorMessage: '',
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('cat_info')
        .orderBy('data', descending: true)
        .snapshots()
        .listen((pliki) {
      final catModels = pliki.docs.map((doc) {
        return CatModel(
          id: doc.id,
          catName: doc['cat_name'],
          catAge: doc['age'].toString(),
          catFood: doc['cat_food'],
          vet: doc['vet'],
          others: doc['others'],
          catDate: doc['data'],
        );
      }).toList();
      emit(MyCatPageState(
        cats: catModels,
        isLoading: false,
        errorMessage: '',
      ));
    })
      ..onError((error) {
        emit(MyCatPageState(
          cats: const [],
          isLoading: false,
          errorMessage: error.toString(),
        ));
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
