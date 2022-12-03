import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cat_app/models/cat_model.dart';
import 'package:cat_app/repositories/cats_repository.dart';
import 'package:meta/meta.dart';

part 'my_cat_page_state.dart';

class MyCatPageCubit extends Cubit<MyCatPageState> {
  MyCatPageCubit(this._catsRepository)
      : super(
          const MyCatPageState(
            cats: [],
            isLoading: false,
            errorMessage: '',
          ),
        );

  StreamSubscription? _streamSubscription;
  final CatsRepository _catsRepository;

  Future<void> delete(documentID) async {
    await _catsRepository.delete(id: documentID);
  }

  Future<void> start() async {
    emit(
      const MyCatPageState(
        cats: [],
        isLoading: true,
        errorMessage: '',
      ),
    );

    _streamSubscription = _catsRepository.getCatStream().listen((catDocs) {
      emit(MyCatPageState(
        cats: catDocs,
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
