import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/book_entity.dart';
import '../../domain/usecase/get_newest_books_use_case.dart';
part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBookUseCase) : super(NewestBooksInitial());
 final  FetchNewestBookUseCase fetchNewestBookUseCase ;
  List<BookEntity> listBook =[] ;
  Future<void> fetchNewestBooks()async {
    emit(NewestBooksLoadingState());
    var result = await fetchNewestBookUseCase.call();
    result.fold(
            (l){
          emit(NewestBooksErrorState(l.message));
        },
            (r){
          listBook = r ;
          emit(NewestBooksSuccessState());
        });
  }
}
