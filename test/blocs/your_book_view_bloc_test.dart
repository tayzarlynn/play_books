import 'package:flutter_test/flutter_test.dart';
import 'package:play_books/bloc/your_book_view_bloc.dart';

import '../data/model/ebooks_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main(){
  group('your_book_view_bloc_test',(){
    YourBookViewBloc? _bloc;
    setUp((){
      _bloc = YourBookViewBloc(EbooksModelImplMock());
    });

    test('get ebooks from database test', (){
      expect(_bloc?.books?.contains(getEBooksMock().first),true);
    });
  });
}