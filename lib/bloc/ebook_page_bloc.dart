import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:play_books/data/model/ebooks_model.dart';
import 'package:play_books/data/model/ebooks_model_impl.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/data/vos/books_list_vo.dart';
import 'package:play_books/utils/modal_and_dialog.dart';
import 'package:play_books/view/pages/add_to_shelf_page.dart';

class EbookPageBloc extends ChangeNotifier {
  ///model
  EbooksModel _model = EbooksModelImpl();

  ///state
  List<BooksListVO>? booksList;
  List<BookVO>? books;

  ///get date
  final DateFormat dateFormatter = DateFormat('yyyy-MM-dd');
  String? date;

  EbookPageBloc([EbooksModel? ebooksModelMock]) {
    ///for unit testing
    if(ebooksModelMock != null) _model = ebooksModelMock;

    ///format date
    date = date ?? dateFormatter.format(DateTime.now());

    ///get ebooks list for ebook page
    _model.getEbooksListFromDataBase(date!).listen((response) {
      booksList = response;
      notifyListeners();
    });

    ///get library books from database
    _model.getLibraryEbooksFromDatabaseWithTitle().listen((event) {
      books = event;
      notifyListeners();
    });
  }

  ///tap on carousel vertical more icon
  void onTapCarousel(BuildContext context, BookVO book) {
    ModalAndDialog.bookBottomSheet(
      context,
      book,
      (book) => deleteFromLibrary(context, book).then((value) =>  Navigator.pop(context)),
      () => addToShelf(context, book),
    );
  }

  ///try to explain
  Future deleteFromLibrary(BuildContext context, BookVO book) {
   return _model.deleteBookFromLibrary(book.title.toString());

  }

  void addToShelf(BuildContext context, BookVO book) {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddToShelfPage(book)));
  }


}
