import 'package:bookly/Features/home/Data/data_source/local_data_source.dart';
import 'package:bookly/Features/home/Data/data_source/remote_data_source.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo{
  final HomeRemoteDataSource homeRemoteDataSource ;
  final HomeLocalDataSource homeLocalDataSource ;
  HomeRepoImpl({ required this.homeRemoteDataSource,
  required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>>
  getFeaturedBooks({int pageNum =0})async {
    try{
      List<BookEntity> books;
      books =  homeLocalDataSource.getFeaturedBooks(
        pageNum: pageNum ,
      );
     if(books.isNotEmpty){
       return Right(books);
     }
       books = await homeRemoteDataSource.getFeaturedBooks(pageNum:pageNum );
      return Right(books);
    }catch(e) {
      if(e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
        return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> getNewestBooks()async {
    try{
      List<BookEntity> books ;
       books =  homeLocalDataSource.getNewestBooks();
      if(books.isNotEmpty){
        return Right(books);
      }
       books = await homeRemoteDataSource.getNewestBooks();
      return Right(books);
    }catch (e) {
      if(e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
        return Left(ServerFailure(e.toString()));
    }
  }

}