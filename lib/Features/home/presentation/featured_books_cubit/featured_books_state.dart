
abstract class FeaturedBooksState {}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksSuccessState extends FeaturedBooksState {}
class FeaturedBooksErrorState extends FeaturedBooksState {
  final String errorMessage;
  FeaturedBooksErrorState(this.errorMessage);
}
class FeaturedBooksLoadingState extends FeaturedBooksState{}
class FeaturedBooksPaginationLoadingState extends FeaturedBooksState{}