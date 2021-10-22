import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/view/resources/dimens.dart';

class ThreeColumnGridLayout extends StatelessWidget {
  final List<BookVO>? books;

  ThreeColumnGridLayout({this.books});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: books?.length ?? 0,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.65,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM, vertical: MARGIN_MEDIUM),
          child: Container(
            child: BookView(books?[index]),
          ),
        );
      },
    );
  }
}

class BookView extends StatelessWidget {
  final BookVO? book;
  final Function(BookVO)? onTapBook;

  BookView(this.book, {this.onTapBook});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.43,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            color: Colors.black,
            height: MediaQuery.of(context).size.height * 0.18,
            imageUrl: '${book?.bookImage}',
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          const SizedBox(
            height: MARGIN_SMALL,
          ),
          Text(
            '${book?.title}',
            maxLines: 1,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          Text(
            '${book?.author}',
            style: TextStyle(
              fontSize: 11,
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
