import 'package:flutter/material.dart';
import 'package:play_books/view/resources/dimens.dart';

class EmptyShelfView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.book_outlined,
              color: Colors.black,
              size: 100,
            ),
            SizedBox(
              height: MARGIN_LARGE,
            ),
            Text(
              'Ready to fill',
              style: TextStyle(
                fontSize: TEXT_REGULAR_3X,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: MARGIN_LARGE,
            ),
            Text(
                'Tap the menu icon on a book cover ,then select \n \"Add to self\"',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: TEXT_REGULAR_2X,
            ),),
          ],
        ),
      ),
    );
  }
}
