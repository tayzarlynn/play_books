import 'package:flutter/material.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/view/layout/two_column_grid_layout.dart';

import 'ebook_detail_page.dart';

class AllEbooksSearchResultPage extends StatelessWidget {
  final List<BookVO>? books;

  AllEbooksSearchResultPage(this.books);

  @override
  Widget build(BuildContext context) {
    return TwoColumnGridLayout(
      physics: ScrollPhysics(),
      books: books,
      onTapBook: (primaryIsbn10) => _navigateToBookDetail(context, primaryIsbn10),
    );
  }

  void _navigateToBookDetail(BuildContext context, String primaryIsbn10) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EBookDetailPage(primaryIsbn10),
      ),
    );
  }
}
