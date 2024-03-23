import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/featured_books_cubit/featured_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/get_it_service.dart';
import '../../../domain/usecase/get_featured_book_use_case.dart';
import 'custom_book_item.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({Key? key}) : super(key: key);

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
   List<BookEntity>  books = [];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: BlocProvider(
        create: (context) => FeaturedBooksCubit(
          FetchBooksUseCase(GetItService.gitItHomeRepo),
        )..fetchFeaturedBooks()..scroll(),
        child: BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
          listener:(context, state){
            var cubit = FeaturedBooksCubit.get(context);
            if(state is FeaturedBooksSuccessState) {
              books.addAll(cubit.listBook);
            }
          } ,
          builder: (context, state) {
            var cubit = FeaturedBooksCubit.get(context);
            if (state is FeaturedBooksLoadingState ) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FeaturedBooksErrorState) {
              return Center(child: Text(state.errorMessage));
            } else if (state is FeaturedBooksSuccessState
                ||state is FeaturedBooksPaginationLoadingState
            ) {
              return ListView.builder(
                  controller: cubit.scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: CustomBookImage(
                        image: books[index].image ?? '',
                      ),
                    );
                  });
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
