import 'package:flutter_test/flutter_test.dart';
import 'package:play_books/bloc/all_ebooks_page_bloc.dart';

import '../data/model/ebooks_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main(){
  group('all_ebooks_page_bloc_test',(){
    AllEbooksPageBloc? _bloc;
    setUp(() {
      _bloc = AllEbooksPageBloc('combined-print-and-e-book-fiction',EbooksModelImplMock());
    });
    test('all ebooks page test',(){
      expect(_bloc?.books?.contains(getEBooksMock().first), true);
    });
  });
}