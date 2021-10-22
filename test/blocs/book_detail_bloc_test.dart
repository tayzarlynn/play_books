import 'package:flutter_test/flutter_test.dart';
import 'package:play_books/bloc/ebook_detail_bloc.dart';

import '../data/model/ebooks_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main() {
  group('book_detail_bloc_test', () {
    EbookDetailBloc? _bloc;
    setUp((){
      _bloc = EbookDetailBloc("primaryIsbn10",EbooksModelImplMock());
    });
    test('ebook detail test', () {
      expect(_bloc?.book, getEBooksMock().first);
    });
  });
}
