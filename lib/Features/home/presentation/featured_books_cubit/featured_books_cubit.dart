import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/book_entity.dart';
import '../../domain/usecase/get_featured_book_use_case.dart';
import 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchBooksUseCase) : super(FeaturedBooksInitial());
  static  FeaturedBooksCubit get(context) => BlocProvider.of(context);
  final FetchBooksUseCase fetchBooksUseCase ;
   final ScrollController scrollController = ScrollController();

  List<BookEntity> listBook =[] ;

  Future<void> fetchFeaturedBooks({int pageNum =0 })async {
    if(pageNum ==0) {
      emit(FeaturedBooksLoadingState());
    }else{
      emit(FeaturedBooksPaginationLoadingState());
    }
  var result = await fetchBooksUseCase.call(pageNum);
   result.fold(
           (l){
             emit(FeaturedBooksErrorState(l.message));
           },
           (r){
             listBook =r  ;
             emit(FeaturedBooksSuccessState());
           });
  }

  void scroll(){
    int nextPage =1 ;
    bool isLoading = false ;
    scrollController.addListener(
            ()async{
      var currentPosition = scrollController.position.pixels ;
      var maxScroll = scrollController.position.maxScrollExtent ;
      if(currentPosition >=0.7 *maxScroll){
        if(!isLoading) {
          isLoading = true ;
         await fetchFeaturedBooks(pageNum: nextPage++);
          isLoading = false ;
        }
      }
    }
    );
  }
}
