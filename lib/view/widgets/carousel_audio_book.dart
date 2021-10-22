import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/view/resources/dimens.dart';

class CarouselAudioBook extends StatelessWidget {
  final BookVO book;
  final Function onTapCarouse;

  CarouselAudioBook(this.book,this.onTapCarouse);

  @override
  Widget build(BuildContext context) {
    String imageUrl = (book.bookImage != null)
        ? book.bookImage.toString()
        : book.imageLinks!.thumbnail.toString();
    return Container(
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
                imageUrl,
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
          MeatballsView(onTapCarouse),
          IconAndProgressBarView()
        ],
      ),
    );
  }
}

class MeatballsView extends StatelessWidget {
  final Function onTapCarouse;

  MeatballsView(this.onTapCarouse);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: MARGIN_MEDIUM, right: MARGIN_MEDIUM),
      child: Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: Icon(
              Icons.more_horiz,
              size: 38,
              color: Colors.white,
            ),
            onPressed: () {
              onTapCarouse();
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  child: Center(
                    child: Icon(
                      Icons.headset_outlined,
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(61, 61, 61, 1.0),
                      borderRadius: BorderRadius.circular(7)),
                ),
                Spacer(),
                Container(
                  width: 35,
                  height: 35,
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
              ],
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
