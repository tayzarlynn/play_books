import 'package:flutter/material.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/data/vos/books_list_vo.dart';
import 'package:play_books/view/resources/dimens.dart';

import '../widgets/ebook.dart';

class TitleAndEbooksHorizontalView extends StatelessWidget {
  final BooksListVO booksList;
  final Function(String, String) onTapTitleAndArrow;
  final Function(String) onTapBook;

  TitleAndEbooksHorizontalView(
      this.booksList, this.onTapTitleAndArrow, this.onTapBook);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleAndArrowView(
            booksList, booksList.displayName.toString(), onTapTitleAndArrow),
        const SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        HorizontalEbookView(
            books: booksList.books, onTapBook: onTapBook, booksList: booksList),
      ],
    );
  }
}

class TitleAndArrowView extends StatelessWidget {
  final BooksListVO booksList;
  final String title;
  final Function(String, String) onTapTitleAndArrow;

  TitleAndArrowView(this.booksList, this.title, this.onTapTitleAndArrow);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapTitleAndArrow(booksList.listName.toString(),
            booksList.listNameEncoded.toString());
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: TEXT_REGULAR_3X,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}

class HorizontalEbookView extends StatelessWidget {
  final List<BookVO>? books;
  final Function(String) onTapBook;
  final BooksListVO booksList;

  const HorizontalEbookView({
    required this.books,
    required this.onTapBook,
    required this.booksList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.33,
      child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return EBook(books![index],onTapBook:onTapBook);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: MARGIN_MEDIUM_2,
            );
          },
          itemCount: books!.length),
    );
  }
}
