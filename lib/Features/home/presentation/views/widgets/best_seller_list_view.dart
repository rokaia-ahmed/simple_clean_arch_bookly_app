import 'package:bookly/Features/home/domain/usecase/get_newest_books_use_case.dart';
import 'package:bookly/Features/home/presentation/newst_books_cubit/newest_books_cubit.dart';
import 'package:bookly/core/utils/get_it_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewestBooksCubit(
              FetchNewestBookUseCase(GetItService.gitItHomeRepo))
            ..fetchNewestBooks(),
      child: BlocBuilder<NewestBooksCubit, NewestBooksState>(
        builder: (context, state) {
          NewestBooksCubit cubit = BlocProvider.of(context);
          if(state is NewestBooksLoadingState){
            return const Center(child: CircularProgressIndicator());
          }else if(state is NewestBooksErrorState){
            return Text(state.errorMessage);
          }else{
            return ListView.builder(
             physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: cubit.listBook.length,
              itemBuilder: (context, index) {
                return  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BookListViewItem(
                    item: cubit.listBook[index],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
