import 'package:flutter/material.dart';
import 'package:play_books/view/resources/dimens.dart';
import 'package:play_books/view/widgets/audio_book.dart';

class TitleAndAudioBooksHorizontalView extends StatelessWidget {
  final Function onTapTitleAndArrow, onTapBook;

  TitleAndAudioBooksHorizontalView(this.onTapTitleAndArrow, this.onTapBook);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleAndArrowView(onTapTitleAndArrow),
        const SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.28,
          child: ListView.separated(
              padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    onTapBook();
                  },
                  child: AudioBook(),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: MARGIN_MEDIUM,
                );
              },
              itemCount: 10),
        ),
      ],
    );
  }
}

class TitleAndArrowView extends StatelessWidget {
  final Function onTapTitleAndArrow;

  TitleAndArrowView(this.onTapTitleAndArrow);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapTitleAndArrow();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
        child: Row(
          children: [
            Text(
              'New releases',
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
