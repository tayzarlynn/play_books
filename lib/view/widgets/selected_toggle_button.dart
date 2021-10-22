import 'package:flutter/material.dart';
import 'package:play_books/view/resources/dimens.dart';

class SelectedToggleButton extends StatelessWidget {
  final List<String> textList;

  const SelectedToggleButton(this.textList);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) =>
            SelectedTextView(textList[index]),
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(
              width: MARGIN_MEDIUM,
            ),
        itemCount: textList.length);
  }
}

class SelectedTextView extends StatelessWidget {
  final String title;

  const SelectedTextView(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      padding: const EdgeInsets.symmetric(
        horizontal: MARGIN_MEDIUM_2,
        vertical: MARGIN_MEDIUM,
      ),
      decoration: BoxDecoration(
        color: Color.fromRGBO(32, 81, 127, 1.0),
        border: Border.all(
          width: 1,
          color: Colors.black12,
        ),
        borderRadius: BorderRadius.circular(MARGIN_MEDIUM_3),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: TEXT_REGULAR_2X,
        ),
      ),
    );
  }
}
