import 'package:play_books/data/model/ebooks_model.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/data/vos/books_list_vo.dart';
import 'package:play_books/data/vos/shelf_vo.dart';
import 'package:play_books/network/data_agent/ebooks_data_agent.dart';
import 'package:play_books/network/data_agent/ebooks_data_agent_impl.dart';
import 'package:play_books/persistence/dao/book_dao.dart';
import 'package:play_books/persistence/dao/book_list_dao.dart';
import 'package:play_books/persistence/dao/impl/book_dao_impl.dart';
import 'package:play_books/persistence/dao/impl/books_list_dao_impl.dart';
import 'package:play_books/persistence/dao/impl/library_book_dao_impl.dart';
import 'package:play_books/persistence/dao/impl/shelf_dao_impl.dart';
import 'package:play_books/persistence/dao/library_book_dao.dart';
import 'package:play_books/persistence/dao/shelf_dao.dart';
import 'package:stream_transform/stream_transform.dart';

class EbooksModelImpl extends EbooksModel {
  ///Data Agent
  EbooksDataAgent _dataAgent = EbooksDataAgentImpl();

  ///DAO
  BooksListDAO _booksListDAO = BooksListDAOImpl();
  BookDAO _bookDAO = BookDAOImpl();
  LibraryBookDAO _libraryBookDAO = LibraryBookDAOImpl();
  ShelfDAO _shelfDAO = ShelfDAOImpl();

  ///-------------------------------for unit testing -------------------------------///

  void setDataAgentAndDaosForMock(
      EbooksDataAgent dataAgent,
      BooksListDAO booksListDAO,
      BookDAO bookDAO,
      LibraryBookDAO libraryBookDAO,
      ShelfDAO shelfDAO) {
    _dataAgent = dataAgent;
    _booksListDAO = booksListDAO;
    _bookDAO = bookDAO;
    _libraryBookDAO = libraryBookDAO;
    _shelfDAO = shelfDAO;

  }

  ///----------------------------------------------------------------------------///

  ///-------------------------------for ebook page-------------------------------///
  @override
  void getEbooksList(String date) {
    _dataAgent.getEbooksList(date)?.then((value) {
      List<BookVO>? books;
      value?.map((e) {
        books = e.books;
        _bookDAO.saveAllBooksFromNetwork(books!);
      }).toList();

      _booksListDAO.saveAllBooksList(value);
    });
  }

  @override
  Stream<List<BooksListVO>?> getEbooksListFromDataBase(String date) {
    this.getEbooksList(date);
    return _booksListDAO
        .getAllBooksListEventStream()
        .startWith(_booksListDAO.getAllBookListStream())
        .map((event) => _booksListDAO.getAllBookList());
  }

  ///-------------------------------for ebook list by listNameEncode-------------------------------///
  @override
  void getEbooksListByName(String listNameEncode) {
    _dataAgent.getEbooksListByList(listNameEncode)?.then((value) {
      List<BookVO?>? books = value?.map((book) {
        book.listNameEncode = listNameEncode;
        return book;
      }).toList();
      _bookDAO.saveAllBooksFromNetwork(books ?? []);
    });
  }

  @override
  Stream<List<BookVO>> getEbooksListByNameFromDataBase(String listNameEncode) {
    this.getEbooksListByName(listNameEncode);
    return _bookDAO
        .getAllBooksEventStream()
        .startWith(
            _bookDAO.getBookListByListNameFromDataBaseStream(listNameEncode))
        .map((event) =>
            _bookDAO.getBookListByListNameFromDataBase(listNameEncode));
  }

  ///-------------------------------for ebook search-------------------------------///
  @override
  void getBookSearch(String queryValue) {
    _dataAgent.getBookSearch(queryValue)?.then((value) {
      List<BookVO?>? books = value?.map((e) {
        e?.volumeInfo?.queryValue = queryValue;

        ///for image
        if (e?.volumeInfo?.bookImage == null) {
          e?.volumeInfo?.bookImage = e.volumeInfo?.imageLinks?.thumbnail ?? '';
        }

        ///for author
        if (e?.volumeInfo?.author == null) {
          e?.volumeInfo?.author = e.volumeInfo?.authors?[0] ?? '';
        }
        return e?.volumeInfo;
      }).toList();
      _bookDAO.saveAllBooksFromNetwork(books ?? []);
    });
  }

  @override
  Stream<List<BookVO>> getBookSearchFromDataBase(String queryValue) {
    this.getBookSearch(queryValue);
    return _bookDAO
        .getAllBooksEventStream()
        .startWith(_bookDAO.getBookSearchFromDataBaseStream(queryValue))
        .map((event) => _bookDAO.getBookSearchFromDataBase(queryValue));
  }

  ///-------------------------------for book detail -------------------------------///

  BookVO? getBookDetail(String title) {
    return _bookDAO.getBook(title);
  }

  ///-------------------------------for library-------------------------------///
  @override
  void saveBookToLibrary(String name, BookVO bookVO) {
    _libraryBookDAO.saveBookToLibrary(name, bookVO);
  }

  @override
  Future deleteBookFromLibrary(String name) {
    return _libraryBookDAO.deleteBookFromLibrary(name);
  }
 @override
  BookVO? getBookFromLibrary(String title) {
    return _libraryBookDAO.getBook(title);
  }

  @override
  Stream<List<BookVO>> getLibraryEbooksFromDatabaseWithTitle() {
    return _libraryBookDAO
        .getAllLibraryBooksEvent()
        .startWith(_libraryBookDAO.getAllLibraryBooksWithTitleStream())
        .map((event) => _libraryBookDAO.getAllBooksFromLibraryWithTitle());
  }

  @override
  Stream<List<BookVO>> getLibraryEbooksFromDatabaseWithAuthor() {
    return _libraryBookDAO
        .getAllLibraryBooksEvent()
        .startWith(_libraryBookDAO.getAllLibraryBooksWithAuthorStream())
        .map((event) => _libraryBookDAO.getAllBooksFromLibraryWithAuthor());
  }

  ///-------------------------------for shelf-------------------------------///
  @override
  Future createShelf(String id, ShelfVO shelf) {
    return _shelfDAO.createShelf(id, shelf);
  }

  Future updateShelf(String editID, String name) {
    return _shelfDAO.updateShelf(editID, name);
  }

  @override
  ShelfVO? getShelf(String id) {
    return _shelfDAO.getShelf(id);
  }

  @override
  void deleteShelf(String id) {
    _shelfDAO.deleteShelf(id);
  }

  @override
  Future addBookToShelf(BookVO book, String uniqueID) {
    ShelfVO? shelf = getShelf(uniqueID);
    if (shelf?.bookList == null) {
      shelf?.bookList = [];
    }

    if (shelf?.bookList?.contains(book) == false) {
      shelf?.bookList?.add(book);
    }

    return _shelfDAO.createShelf(uniqueID, shelf!);
  }

  @override
  Stream<List<ShelfVO>> getAllShelf() {
    return _shelfDAO
        .getAllShelfEventStream()
        .startWith(_shelfDAO.getAllShelfStream())
        .map((event) => _shelfDAO.getAllShelf());
  }

  ///-------------------------------for shelf books-------------------------------///
  @override
  Stream<List<BookVO>> getShelfEbooksFromDatabaseWithTitle(String uniqueID) {
    return _shelfDAO
        .getAllShelfEventStream()
        .startWith(
            _shelfDAO.getShelfEbooksFromDatabaseWithTitleStream(uniqueID))
        .map(
            (event) => _shelfDAO.getShelfEbooksFromDatabaseWithTitle(uniqueID));
  }

  @override
  Stream<List<BookVO>> getShelfEbooksFromDatabaseWithAuthor(String uniqueID) {
    return _shelfDAO
        .getAllShelfEventStream()
        .startWith(
            _shelfDAO.getShelfEbooksFromDatabaseWithAuthorStream(uniqueID))
        .map((event) =>
            _shelfDAO.getShelfEbooksFromDatabaseWithAuthor(uniqueID));
  }
}
