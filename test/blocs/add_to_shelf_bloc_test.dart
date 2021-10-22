import 'package:flutter_test/flutter_test.dart';
import 'package:play_books/bloc/add_to_shelf_bloc.dart';

import '../data/model/ebooks_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main() {
  group('add_to_shelf_bloc_test', () {
    AddToShelfBloc? _bloc;
    setUp(() {
      _bloc = AddToShelfBloc(getEBooksMock().first, EbooksModelImplMock());
    });
    test('test add to shelf book', () {
      expect(_bloc?.book, equals(getEBooksMock().first));
    });

    test('get all shelf list',(){
      expect(_bloc?.shelfList?.contains(getShelfMock().first), true);
    });
  });
}
