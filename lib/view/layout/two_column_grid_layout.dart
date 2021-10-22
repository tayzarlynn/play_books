import 'package:flutter/material.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/view/resources/dimens.dart';
import 'package:play_books/view/widgets/ebook.dart';

class TwoColumnGridLayout extends StatelessWidget {
  final List<BookVO>? books;
  final Function(String) onTapBook;
  final ScrollPhysics physics;

  TwoColumnGridLayout({this.books, required this.onTapBook,required this.physics});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      physics: physics,
      shrinkWrap: true,
      itemCount: books?.length ?? 0,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.64,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM, vertical: MARGIN_MEDIUM),
          child: EBook(books?[index],onTapBook:onTapBook),
        );
      },
    );
  }
}
