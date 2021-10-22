import 'package:flutter/material.dart';
import 'package:play_books/view/layout/two_column_audio_book_grid_layout.dart';

class AllAudioBooksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          'New Release',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: TwoColumnAudioBookGridLayout(),
    );
  }
}
