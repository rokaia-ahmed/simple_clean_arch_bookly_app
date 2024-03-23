import 'package:flutter/material.dart';

void scroll(ScrollController scrollController ,cubit ){
  int nextPage =1 ;
  bool isLoading = false ;
  scrollController.addListener(
          ()async{
        var currentPosition = scrollController.position.pixels ;
        var maxScroll = scrollController.position.maxScrollExtent ;
        if(currentPosition >=0.7 *maxScroll){
          if(!isLoading) {
            isLoading = true ;
            await cubit.fetchFeaturedBooks(pageNum: nextPage++);
            isLoading = false ;
          }
        }
      }
  );
}