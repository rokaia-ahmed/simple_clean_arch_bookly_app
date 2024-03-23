import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBookUseCase extends UseCase<List<BookEntity>,NoParam>{
 final HomeRepo repo ;
  FetchNewestBookUseCase(this.repo);
  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) {
   return  repo.getNewestBooks();
  }

}