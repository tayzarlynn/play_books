import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/data/vos/shelf_vo.dart';

abstract class ShelfDAO{
  Future createShelf(String uniqueID, ShelfVO shelf);
  ShelfVO? getShelf(String uniqueID);
  void deleteShelf(String uniqueID);
  Future updateShelf(String editID,String name);
  List<ShelfVO> getAllShelf();
  List<BookVO> getShelfEbooksFromDatabaseWithTitle(String uniqueID);
  List<BookVO> getShelfEbooksFromDatabaseWithAuthor(String uniqueID);

  Stream<void> getAllShelfEventStream();
  Stream<List<BookVO>> getShelfEbooksFromDatabaseWithTitleStream(
      String uniqueID);
  Stream<List<BookVO>> getShelfEbooksFromDatabaseWithAuthorStream(
      String uniqueID);
  Stream<List<ShelfVO>> getAllShelfStream();
}