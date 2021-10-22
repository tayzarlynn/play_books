import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/view/resources/dimens.dart';

class CarouselEbook extends StatelessWidget {
  final BookVO? book;
  final Function(BookVO) onTapCarouse;
  final int index;

  CarouselEbook(this.book,this.onTapCarouse,this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:'${book?.bookImage}',
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 5,
                    offset: Offset(0, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2),
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
          MeatballsView(onTapCarouse,book,index),
          IconAndProgressBarView()
        ],
      ),
    );
  }
}

class MeatballsView extends StatelessWidget {
  final Function(BookVO) onTapCarouse;
  final BookVO? book;
  final int index;

  MeatballsView(this.onTapCarouse,this.book,this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: MARGIN_SMALL, right: MARGIN_SMALL),
      child: Align(
          alignment: Alignment.topRight,
          child: IconButton(
            key: Key('menu'),
            icon: Icon(
              Icons.more_vert_outlined,
              size: 32,
              color: Colors.white,
            ),
            onPressed: () {
              onTapCarouse(book!);
            },
          )),
    );
  }
}

class IconAndProgressBarView extends StatelessWidget {
  const IconAndProgressBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: MARGIN_MEDIUM, left: MARGIN_MEDIUM, bottom: MARGIN_MEDIUM),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 32,
              height: 32,
              child: Center(
                child: Icon(
                  Icons.download_done_outlined,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(61, 61, 61, 1.0),
                  borderRadius: BorderRadius.circular(7)),
            ),
            const SizedBox(
              height: MARGIN_SMALL,
            ),
            LinearProgressIndicator(
              value: 0.2,
              backgroundColor: Colors.black45,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
