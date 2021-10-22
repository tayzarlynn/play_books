import 'package:flutter_test/flutter_test.dart';
import 'package:play_books/bloc/ebook_page_bloc.dart';
import 'package:play_books/data/model/ebooks_model_impl.dart';

import '../data/model/ebooks_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main() {
  group('ebook_page_bloc_test', () {
    EbookPageBloc? _bloc;
    setUp(() {
      _bloc = EbookPageBloc(EbooksModelImplMock());
    });

    test('books list for ebook page test', () {
      expect(_bloc?.booksList?.contains(getEbooksListMock().first), true);
    });

    test('books list for library carousel test', () {
      expect(_bloc?.books?.contains(getEBooksMock().first), true);
    });
  });
}
