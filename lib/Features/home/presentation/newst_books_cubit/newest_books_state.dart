part of 'newest_books_cubit.dart';

abstract class NewestBooksState {}

 class NewestBooksInitial extends NewestBooksState {}

class NewestBooksSuccessState extends NewestBooksState {}
class NewestBooksErrorState extends NewestBooksState {
  final String errorMessage;
  NewestBooksErrorState(this.errorMessage);
}
class NewestBooksLoadingState extends NewestBooksState{}
