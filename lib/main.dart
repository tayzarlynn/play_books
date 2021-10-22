import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/data/vos/books_list_vo.dart';
import 'package:play_books/data/vos/image_links_vo.dart';
import 'package:play_books/data/vos/shelf_vo.dart';
import 'package:play_books/persistence/constant.dart';
import 'package:play_books/view/pages/main_page.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(BooksListVOAdapter());
  Hive.registerAdapter(BookVOAdapter());
  Hive.registerAdapter(ImageLinksVOAdapter());
  Hive.registerAdapter(ShelfVOAdapter());

  await Hive.openBox<BooksListVO>(BOOKS_LIST_BOX_NAME);
  await Hive.openBox<BookVO>(BOOK_VO_BOX_NAME);
  await Hive.openBox<BookVO>(BOOK_VO_LIBRARY_BOX_NAME);
  await Hive.openBox<ShelfVO>(SHELF_VO_BOX_NAME);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final int? index;
  MyApp({this.index = 0});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: MainPage(index ?? 0),
     // home: YourBooksView(),
    );
  }
}
