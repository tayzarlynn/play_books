import 'package:flutter/material.dart';
import 'package:play_books/bloc/all_ebooks_page_bloc.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/view/layout/two_column_grid_layout.dart';
import 'package:provider/provider.dart';

import 'ebook_detail_page.dart';

class AllEBooksPage extends StatelessWidget {
  final listName, listNameEncoded;

  AllEBooksPage(this.listName, this.listNameEncoded);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
     // create: (context) => AllEbooksPageBloc(listNameEncoded),
      value:  AllEbooksPageBloc(listNameEncoded),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Text(
            listName,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Selector<AllEbooksPageBloc, List<BookVO>?>(
          selector: (context, bloc) => bloc.books,
          builder: (context, books, child) => ((books?.length?? 0)>0)
              ? TwoColumnGridLayout(
                  physics: ScrollPhysics(),
                  books: books,
                  onTapBook: (primaryIsbn10) => _navigateToBookDetail(context, primaryIsbn10),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }

  void _navigateToBookDetail(BuildContext context,String primaryIsbn10) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EBookDetailPage(primaryIsbn10),
      ),
    );
  }
}
