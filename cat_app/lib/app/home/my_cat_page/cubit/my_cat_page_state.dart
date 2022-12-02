part of 'my_cat_page_cubit.dart';

@immutable
class MyCatPageState {
  const MyCatPageState({
    this.cats = const [],
    this.isLoading = false,
    this.errorMessage = '',
  });
  final List<CatModel> cats;
  final bool isLoading;
  final String errorMessage;
}
