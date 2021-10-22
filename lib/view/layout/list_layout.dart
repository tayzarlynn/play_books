import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/view/resources/dimens.dart';

class ListLayout extends StatelessWidget {
  final List<BookVO>? books;

  ListLayout({this.books});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) =>
            ListViewItem(books?[index]),
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
              height: MARGIN_MEDIUM_3,
            ),
        itemCount: books?.length ?? 0);
  }
}

class ListViewItem extends StatelessWidget {
  final BookVO? book;

  ListViewItem(this.book);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          color: Colors.black,
          width: MediaQuery.of(context).size.height * 0.1,
          height: MediaQuery.of(context).size.height * 0.14,
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
          width: MARGIN_MEDIUM_2,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.45,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${book?.title}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: TEXT_REGULAR_2X,
                ),
              ),
              const SizedBox(
                height: MARGIN_SMALL,
              ),
              Text('${book?.author}'),
            ],
          ),
        ),
        const SizedBox(
          width: MARGIN_MEDIUM_3,
        ),
        Icon(Icons.download_done_outlined),
        const SizedBox(
          width: MARGIN_MEDIUM_3,
        ),
        Icon(Icons.more_horiz_outlined),
      ],
    );
  }
}
