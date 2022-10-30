part of 'my_cat_page_cubit.dart';

@immutable
class MyCatPageState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final CollectionReference<Map<String, dynamic>>? collection1;
  final bool isLoading;
  final String errorMessage;

  const MyCatPageState(
      {required this.documents,
      required this.isLoading,
      required this.errorMessage,
      required this.collection1});
}
