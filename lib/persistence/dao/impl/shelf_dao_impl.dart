import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/data/vos/shelf_vo.dart';
import 'package:play_books/persistence/constant.dart';
import 'package:play_books/persistence/dao/shelf_dao.dart';

class ShelfDAOImpl extends ShelfDAO{
  static final ShelfDAOImpl singleton = ShelfDAOImpl._internal();

  factory ShelfDAOImpl() {
    return singleton;
  }

  ShelfDAOImpl._internal();

  ///-------------------------------Shelf CRUD-------------------------------///

  Future createShelf(String uniqueID, ShelfVO shelf) {
    return _getBox().put(uniqueID, shelf);
  }

  ShelfVO? getShelf(String uniqueID) {
    return _getBox().get(uniqueID);
  }

  void deleteShelf(String uniqueID) {
    _getBox().delete(uniqueID);
  }

  Future updateShelf(String editID,String name) {
    ShelfVO? shelf = getShelf(editID);
    shelf!.name = name;
   return _getBox().put(editID, shelf);
  }

  List<ShelfVO> getAllShelf() {
    if (_getBox().isNotEmpty) {
      return _getBox().values.toList();
    } else {
      return [];
    }
  }

  ///-------------------------------for shelf's book-------------------------------///
  List<BookVO> getShelfEbooksFromDatabaseWithTitle(String uniqueID) {
    if (getShelf(uniqueID)?.bookList == null) {
      getShelf(uniqueID)?.bookList = [];
    }
    if ((getShelf(uniqueID)?.bookList?.length ?? 0) > 0) {
      return getShelf(uniqueID)?.bookList?.toList() ?? [];
    } else {
      return [];
    }
  }

  List<BookVO> getShelfEbooksFromDatabaseWithAuthor(String uniqueID) {
    if (getShelf(uniqueID)!.bookList == null) {
      getShelf(uniqueID)!.bookList = [];
    }
    if (getShelf(uniqueID)!.bookList!.toList().isNotEmpty &&
        getShelf(uniqueID)!.bookList!.length > 0) {
      List<BookVO> books = getShelf(uniqueID)!.bookList!.toList();
      books.sort((a, b) => a.author.toString().compareTo(b.author.toString()));
      return books;
    } else {
      return [];
    }
  }

  ///-------------------------------reactive-------------------------------///
  Stream<void> getAllShelfEventStream() {
    return _getBox().watch();
  }

  Stream<List<BookVO>> getShelfEbooksFromDatabaseWithTitleStream(
      String uniqueID) {
    return Stream.value(getShelfEbooksFromDatabaseWithTitle(uniqueID));
  }

  Stream<List<BookVO>> getShelfEbooksFromDatabaseWithAuthorStream(
      String uniqueID) {
    return Stream.value(getShelfEbooksFromDatabaseWithAuthor(uniqueID));
  }

  Stream<List<ShelfVO>> getAllShelfStream() {
    return Stream.value(getAllShelf());
  }

  Box<ShelfVO> _getBox() {
    return Hive.box<ShelfVO>(SHELF_VO_BOX_NAME);
  }
}
