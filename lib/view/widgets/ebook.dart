import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/view/resources/dimens.dart';

class EBook extends StatelessWidget {
  final BookVO? book;
  final Function(String)? onTapBook;

  EBook(this.book, {this.onTapBook});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.43,
      child: GestureDetector(
        onTap: () {
          //onTapBook!(book!.title.toString());
          },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              height: MediaQuery.of(context).size.height * 0.28,
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
                child: Image.asset('assets/images/book_placeholder.png'),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            const SizedBox(
              height: MARGIN_SMALL,
            ),
            GestureDetector(
              ///for ui testing
              onTap: () {
                onTapBook!(book!.title.toString());
              },
              child: Text(
               book?.title ?? '',
                overflow: TextOverflow.ellipsis,
               // maxLines: 1,
              ),
            ),
            const SizedBox(
              height: MARGIN_SMALL,
            ),
            Text(
              book?.author ?? '',
              style: TextStyle(
                fontSize: 12,
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
