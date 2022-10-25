// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'my_cat_page_state.dart';

class MyCatPageCubit extends Cubit<MyCatPageState> {
  MyCatPageCubit()
      : super(
          const MyCatPageState(
            documents: [],
            isLoading: false,
            errorMessage: '',
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const MyCatPageState(
        documents: [],
        isLoading: true,
        errorMessage: '',
      ),
    );
    _streamSubscription = FirebaseFirestore.instance
        .collection('cat_info')
        .orderBy('data', descending: true)
        .snapshots()
        .listen((data) {
      emit(MyCatPageState(
        documents: data.docs,
        isLoading: false,
        errorMessage: '',
      ));
    })
      ..onError((error) {
        emit(MyCatPageState(
          documents: const [],
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
