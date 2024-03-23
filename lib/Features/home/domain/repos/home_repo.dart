import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';

abstract class HomeRepo{
   Future<Either<Failure,List<BookEntity>>> getFeaturedBooks({int pageNum =0});
   Future<Either<Failure,List<BookEntity>>> getNewestBooks();
}