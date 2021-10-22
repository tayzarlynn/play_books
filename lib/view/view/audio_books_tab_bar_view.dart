import 'package:flutter/material.dart';
import 'package:play_books/view/resources/dimens.dart';
import 'package:play_books/view/view/title_and_audio_books_horizontal_view.dart';

class AudioBooksTabBarView extends StatelessWidget {
  final Function onTapTitleAndArrow, onTapBook;

  AudioBooksTabBarView(this.onTapTitleAndArrow, this.onTapBook);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          TitleAndAudioBooksHorizontalView(onTapTitleAndArrow, onTapBook),
          const SizedBox(
            height: MARGIN_MEDIUM_3,
          ),
          TitleAndAudioBooksHorizontalView(onTapTitleAndArrow, onTapBook),
        ],
      ),
    );
  }
}
