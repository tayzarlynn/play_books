import 'package:flutter_test/flutter_test.dart';
import 'package:play_books/bloc/your_shelves_view_bloc.dart';

import '../data/model/ebooks_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main(){
  group('your_shelves_view_bloc_test',(){
    YourShelvesViewBloc? _bloc;
    setUp((){
      _bloc = YourShelvesViewBloc(EbooksModelImplMock());
    });
    test('get all shelf list', (){
      expect(_bloc?.shelfList?.contains(getShelfMock().first), true);
    });
  });

}