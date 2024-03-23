import 'package:bookly/Features/home/Data/models/books_model.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/constants.dart';
import '../../../../core/functions/save_box.dart';
import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource{
  Future<List<BookEntity>> getFeaturedBooks({int pageNum =0});
  Future<List<BookEntity>> getNewestBooks();
}
class HomeRemoteDataSourceImpel extends HomeRemoteDataSource{
  final ApiService apiService ;
  HomeRemoteDataSourceImpel(this.apiService);
  @override
  Future<List<BookEntity>> getFeaturedBooks({int pageNum =0})async {
   var data =await  apiService.get(
       endPoint: 'volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNum *10}');
   List <BookEntity> books =getBooksList(data);
   saveBox(books ,kFeaturedBox);
  /* if(data.isEmpty){
     return [];
   }*/
   return books ;
  }

  @override
  Future<List<BookEntity>> getNewestBooks()async{
    var data =await  apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q=programming&Sorting=newest');
    List <BookEntity> books =getBooksList(data);
    saveBox(books ,kNewestBox);
    return books ;
  }

  List <BookEntity> getBooksList(Map<String,dynamic> data){
    List <BookEntity> books =[];
    for(var item in data['items'] ){
      books.add(BookModel.fromJson(item));
    }
    return books;
  }

}