import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/book_entity.dart';
import '../repos/home_repo.dart';

class FetchBooksUseCase extends UseCase<List<BookEntity>,int>{
  final HomeRepo repo ;
  FetchBooksUseCase(this.repo);
  @override
  Future<Either<Failure, List<BookEntity>>> call([int param =0]) {
  return repo.getFeaturedBooks(pageNum:param );
  }

}
