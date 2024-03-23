import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/adapters.dart';

void saveBox(List<BookEntity> data,String boxName){
  var box = Hive.box<BookEntity>(boxName);
  box.addAll(data);
}