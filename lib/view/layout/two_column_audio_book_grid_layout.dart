import 'package:flutter/material.dart';
import 'package:play_books/view/resources/dimens.dart';
import 'package:play_books/view/widgets/audio_book.dart';

class TwoColumnAudioBookGridLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
     scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 20,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM_2, vertical: MARGIN_MEDIUM_2),
          child: AudioBook(),
        );
      },
    );
  }
}
