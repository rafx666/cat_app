import 'package:bloc/bloc.dart';
import 'package:cat_app/repositories/cats_repository.dart';
import 'package:meta/meta.dart';

part 'my_account_state.dart';

class MyAccountCubit extends Cubit<MyAccountState> {
  MyAccountCubit(this._catsRepository) : super(MyAccountState());

  final CatsRepository _catsRepository;

  Future<void> signOut() async {
    await _catsRepository.signOut();
  }
}
