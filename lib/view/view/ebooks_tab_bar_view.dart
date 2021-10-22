import 'package:flutter/material.dart';
import 'package:play_books/data/vos/books_list_vo.dart';
import 'package:play_books/view/resources/dimens.dart';
import 'package:play_books/view/view/title_and_ebooks_horizontal_view.dart';

class EbooksTabBarView extends StatelessWidget {
  final List<BooksListVO> booksList;
  final Function(String,String) onTapTitleAndArrow;
  final Function(String) onTapBook;

  EbooksTabBarView(this.booksList, this.onTapTitleAndArrow, this.onTapBook);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
          padding: const EdgeInsets.only(top: MARGIN_MEDIUM_3),
          itemBuilder: (BuildContext context, int index) =>
              TitleAndEbooksHorizontalView(
                  booksList[index], onTapTitleAndArrow, onTapBook),
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
                height: MARGIN_MEDIUM_3,
              ),
          itemCount: booksList.length),
    );
  }
}
