import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:play_books/data/vos/shelf_vo.dart';
import 'package:play_books/view/resources/dimens.dart';

class ShelfItem extends StatelessWidget {
  final Function onTapShelf;
  final ShelfVO? shelf;

  ShelfItem({required this.onTapShelf, required this.shelf});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapShelf();
      },
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  _getBookCover(shelf),
                ],
              ),
              const SizedBox(
                width: MARGIN_MEDIUM_3,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      onTapShelf();
                    },
                    child: Text(
                      '${shelf?.name.toString()}',
                      style: TextStyle(
                        fontSize: TEXT_REGULAR_3X,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: MARGIN_MEDIUM,
                  ),
                  Text(_setBookText(shelf)),
                ],
              ),
              Spacer(),
              Icon(Icons.arrow_forward),
            ],
          ),
          Container(
            height: 2,
            child: Divider(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  String _setBookText(ShelfVO? shelf) {
    if (shelf?.bookList?.length != null && (shelf?.bookList?.length ?? 0) > 0) {
      return '${shelf?.bookList?.length} books';
    } else {
      return 'empty';
    }
  }

  Widget _getBookCover(ShelfVO? shelf) {
    if (shelf?.bookList?.length != null && (shelf?.bookList?.length ?? 0) > 0) {
      return CachedNetworkImage(
        width: 65,
        height: 70,
        imageUrl: shelf?.bookList?[0].bookImage.toString() ?? '',
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
            color: Color.fromRGBO(233, 234, 237, 1.0),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(MARGIN_MEDIUM),
              topRight: Radius.circular(MARGIN_MEDIUM),
            ),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => Center(
          child: Image.asset('assets/images/book_placeholder.png'),
        ),
        errorWidget: (context, url, error) => Container(
          margin: const EdgeInsets.only(top: 10),
          width: 65,
          height: 70,
          decoration: BoxDecoration(
            color: Color.fromRGBO(233, 234, 237, 1.0),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(MARGIN_MEDIUM),
              topRight: Radius.circular(MARGIN_MEDIUM),
            ),
          ),
        ),
      );
    } else {
      return Container(
        width: 65,
        height: 70,
        decoration: BoxDecoration(
          color: Color.fromRGBO(233, 234, 237, 1.0),
          // color: Colors.red,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(MARGIN_MEDIUM),
            topRight: Radius.circular(MARGIN_MEDIUM),
          ),
        ),
      );
    }
  }
}
