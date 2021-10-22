import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/view/resources/constant.dart';
import 'package:play_books/view/resources/dimens.dart';

class ModalAndDialog {
  static void bookBottomSheet(BuildContext context, BookVO book,
      Function deleteFromLibrary, Function addToShelf) {
    String author, imageUrl;
    author = ((book.author == null) ? book.authors![0] : book.author)!;
    imageUrl = (book.bookImage != null)
        ? book.bookImage.toString()
        : book.imageLinks!.thumbnail.toString();
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.6,
          padding: const EdgeInsets.symmetric(vertical: MARGIN_MEDIUM_2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: MARGIN_MEDIUM_2, vertical: MARGIN_MEDIUM_3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      color: Colors.black,
                      width: MediaQuery.of(context).size.height * 0.09,
                      height: MediaQuery.of(context).size.height * 0.13,
                      imageUrl: imageUrl,
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
                          borderRadius: BorderRadius.circular(5),
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
                    const SizedBox(
                      width: MARGIN_MEDIUM_3,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            book.title.toString(),
                            style: TextStyle(
                              fontSize: TEXT_REGULAR_3X,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: MARGIN_MEDIUM,
                          ),
                          Text(author),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: MARGIN_MEDIUM_3,
                ),
                height: 2,
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              ListTile(
                dense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM_3,
                  vertical: 0,
                ),
                leading: Icon(Icons.remove_circle_outline),
                title: Text(
                  'Remove download',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: TEXT_REGULAR_2X,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  deleteFromLibrary(book);
                },
                dense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM_3,
                  vertical: 0,
                ),
                leading: Icon(Icons.delete_forever_outlined),
                title: Text(
                  'Delete From library',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: TEXT_REGULAR_2X,
                  ),
                ),
              ),
              ListTile(
                dense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM_3,
                  vertical: 0,
                ),
                leading: Icon(Icons.done),
                title: Text(
                  'Mark as finished',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: TEXT_REGULAR_2X,
                  ),
                ),
              ),
              ListTile(
                key:Key('add to shelf'),
                onTap: () {
                  addToShelf();
                },
                dense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM_3,
                  vertical: 0,
                ),
                leading: Icon(Icons.add),
                title: Text(
                  'Add to shelf',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: TEXT_REGULAR_2X,
                  ),
                ),
              ),
              ListTile(
                dense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM_3,
                  vertical: 0,
                ),
                leading: Icon(Icons.book_outlined),
                title: Text(
                  'About this ebook',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: TEXT_REGULAR_2X,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void sortByRadioBottomSheet(BuildContext context,
      RadioText radioGroupValue, Function onTapRadioButton) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.33,
          padding: const EdgeInsets.symmetric(vertical: MARGIN_MEDIUM_2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_3),
                child: Text(
                  'Sort by',
                  style: TextStyle(
                    fontSize: TEXT_REGULAR_3X,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: MARGIN_MEDIUM_3,
                ),
                height: 2,
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              RadioListTile<RadioText>(
                title: Text(
                  'Author',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: TEXT_REGULAR_2X,
                  ),
                ),
                value: RadioText.Author,
                groupValue: radioGroupValue,
                onChanged: (RadioText? value) {
                  onTapRadioButton(value);
                },
              ),
              RadioListTile<RadioText>(
                title: Text(
                  'Recent',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: TEXT_REGULAR_2X,
                  ),
                ),
                value: RadioText.Recent,
                groupValue: radioGroupValue,
                onChanged: (RadioText? value) {
                  onTapRadioButton(value);
                },
              ),
              RadioListTile<RadioText>(
                title: Text(
                  'Title',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: TEXT_REGULAR_2X,
                  ),
                ),
                value: RadioText.Title,
                groupValue: radioGroupValue,
                onChanged: (RadioText? value) {
                  onTapRadioButton(value);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  static void showCustomDialog(BuildContext context, Function onTapDelete) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.33,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
                    child: Text(
                      'Delete Shelf?',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: TEXT_REGULAR_3X,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
                    child: Text(
                      'This shelf will be deleted from all of your devices.Purchases,samples,uploads, and active rentals on this shelf will stay in \"Your books.\"',
                      style: TextStyle(
                        height: 1.5,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(MARGIN_MEDIUM),
                                  border: Border.all(
                                    color: Colors.black12,
                                    width: 1,
                                  )),
                              child: Center(
                                child: Text('Cancel'),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: MARGIN_MEDIUM,
                        ),
                        Expanded(
                          flex: 3,
                          child: GestureDetector(
                            onTap: () {
                              onTapDelete();
                            },
                            child: Container(
                              key: Key('shelf deleted'),
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(MARGIN_MEDIUM),
                                color: Color.fromRGBO(49, 121, 196, 1.0),
                              ),
                              child: Center(
                                child: Text(
                                  'Delete',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
