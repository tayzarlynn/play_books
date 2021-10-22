import 'package:flutter_test/flutter_test.dart';
import 'package:play_books/bloc/shelf_detail_bloc.dart';

import '../data/model/ebooks_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main(){
  group('shelf_detail_bloc_test',(){
    ShelfDetailBloc? _bloc;
    setUp((){
      _bloc = ShelfDetailBloc('test',EbooksModelImplMock());
    });

    test('create shelf test', (){
      expect(_bloc?.shelf, getShelfMock().first);
    });

    test('get shelf ebook test', (){
      expect(_bloc?.books?.contains(getEBooksMock().first), true);
    });

  });

}