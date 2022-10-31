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
            collection1: null,
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> delete(documentID) async {
    FirebaseFirestore.instance.collection("cat_info").doc(documentID).delete();
  }

  Future<void> start() async {
    emit(
      const MyCatPageState(
        documents: [],
        isLoading: true,
        errorMessage: '',
        collection1: null,
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
        collection1: null,
      ));
    })
      ..onError((error) {
        emit(MyCatPageState(
          documents: const [],
          isLoading: false,
          errorMessage: error.toString(),
          collection1: null,
        ));
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
