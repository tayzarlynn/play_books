import 'package:flutter_test/flutter_test.dart';
import 'package:play_books/data/model/ebooks_model_impl.dart';

import '../../mock_data/mock_data.dart';
import '../../network/data_agent/ebooks_data_agent_impl_mock.dart';
import '../../persistence/book_dao_impl_mock.dart';
import '../../persistence/book_list_dao_impl_mock.dart';
import '../../persistence/library_book_dao_impl_mock.dart';
import '../../persistence/shelf_dao_impl_mock.dart';

void main() {
  group('ebooks_model_impl_test', () {
    EbooksModelImpl model = EbooksModelImpl();

    setUp(() {
      model.setDataAgentAndDaosForMock(
        EbooksDataAgentImplMock(),
        BookListDAOImplMock(),
        BookDAOImplMock(),
        LibraryBooKDAOImplMock(),
        ShelfDAOImplMock(),
      );
    });

    test('Saving and Getting ebooks list from from mock DB', () {
      expect(model.getEbooksListFromDataBase(''), emits(getEbooksListMock()));
    });

    test('Saving and Getting ebooks list by name from mock DB', () {
      expect(
          model.getEbooksListByNameFromDataBase(
              'combined-print-and-e-book-fiction'),
          emits(getEBooksMock()));
    });

    test('Querying from google api', () {
      expect(
          model.getBookSearchFromDataBase('flutter'), emits(getEBooksMock()));
    });

    test('Getting movie detail', () {
      expect(model.getBookDetail('title'), getEBooksMock().first);
    });

    test('Saving and getting ebook to library', () {
      model.saveBookToLibrary('demo', getEBooksMock().first);
      expect(model.getBookFromLibrary('demo'), getEBooksMock().first);
    });

    test('Getting All Library Ebooks from DB', () {
      expect(model.getLibraryEbooksFromDatabaseWithTitle(),
          emits(getEBooksMock()));
    });

    test('CRUD Shelf', () {
      model.createShelf('test', getShelfMock().first);
      expect(model.getShelf('test'), getShelfMock().first);

      model.updateShelf('update', 'ShelfName');
      expect(model.getShelf('update'), getShelfMock().last);

      model.deleteShelf('test');
      expect(model.getShelf('test'), null);

      expect(model.getAllShelf(), emits(getShelfMock()));
    });

    test('shelf book', () {
      model.createShelf('test', getShelfMock().first);
      expect(
        model.getShelfEbooksFromDatabaseWithTitle('test'),
        emits(getEBooksMock()),
      );
    });
  });
}
