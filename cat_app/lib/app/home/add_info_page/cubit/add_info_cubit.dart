import 'package:bloc/bloc.dart';
import 'package:cat_app/repositories/cats_repository.dart';
import 'package:meta/meta.dart';

part 'add_info_state.dart';

class AddInfoCubit extends Cubit<AddInfoState> {
  AddInfoCubit(this._catsRepository) : super(AddInfoState());

  final CatsRepository _catsRepository;

  Future<void> add(
    String catName,
    String age,
    String catFood,
    String vet,
    String others,
    String data,
  ) {
    return _catsRepository.add(
      catName: catName,
      age: age,
      catFood: catFood,
      vet: vet,
      others: others,
      data: data,
    );
  }
}
