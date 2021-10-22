import 'package:flutter/material.dart';
import 'package:play_books/view/resources/dimens.dart';

class HorizontalToggleButton extends StatelessWidget {
  final List<String> textList;

  HorizontalToggleButton(this.textList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(
        horizontal: MARGIN_MEDIUM_2,
        vertical: MARGIN_MEDIUM,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.black12,
        ),
        borderRadius: BorderRadius.circular(MARGIN_MEDIUM_3),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) =>
            Text(textList[index],
            style: TextStyle(
              fontSize: TEXT_REGULAR_2X,
            ),),
        separatorBuilder: (BuildContext context, int index) => DividerView(),
        itemCount: textList.length,
      ),
    );
  }
}

class DividerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: VerticalDivider(
        color: Colors.grey,
      ),
    );
  }
}
