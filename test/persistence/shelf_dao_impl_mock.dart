import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/data/vos/shelf_vo.dart';
import 'package:play_books/persistence/dao/shelf_dao.dart';

import '../mock_data/mock_data.dart';

class ShelfDAOImplMock extends ShelfDAO {
  Map<String, ShelfVO> shelfMockFromDB = {};

  @override
  Future createShelf(String uniqueID, ShelfVO shelf) {
    return Future.value(shelfMockFromDB[uniqueID] = shelf);
  }

  @override
  ShelfVO? getShelf(String uniqueID) {
    return shelfMockFromDB[uniqueID];
  }

  @override
  void deleteShelf(String uniqueID) {
    shelfMockFromDB.remove(uniqueID);
  }

  @override
  Future updateShelf(String editID, String name) {
    return Future.value(shelfMockFromDB[editID] = getShelfMock().last);
  }

  @override
  List<ShelfVO> getAllShelf() {
    return getShelfMock();
  }

  @override
  List<BookVO> getShelfEbooksFromDatabaseWithTitle(String uniqueID) {
    return getShelf(uniqueID)?.bookList?.toList() ?? [];
  }

  @override
  List<BookVO> getShelfEbooksFromDatabaseWithAuthor(String uniqueID) {
    return getShelf(uniqueID)?.bookList?.toList() ?? [];
  }

  @override
  Stream<void> getAllShelfEventStream() {
    return Stream.value(null);
  }

  @override
  Stream<List<BookVO>> getShelfEbooksFromDatabaseWithAuthorStream(
      String uniqueID) {
    return Stream.value(getShelf(uniqueID)?.bookList?.toList() ?? []);
  }

  @override
  Stream<List<BookVO>> getShelfEbooksFromDatabaseWithTitleStream(
      String uniqueID) {
    return Stream.value(getShelf(uniqueID)?.bookList?.toList() ?? []);
  }

  @override
  Stream<List<ShelfVO>> getAllShelfStream() {
    return Stream.value(getAllShelf());
  }
}
