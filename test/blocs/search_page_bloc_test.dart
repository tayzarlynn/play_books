import 'package:flutter_test/flutter_test.dart';
import 'package:play_books/bloc/search_page_bloc.dart';

import '../data/model/ebooks_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main(){
  group('search_page_bloc_test',(){
    SearchPageBloc? _bloc;
    setUp(() {
      _bloc = SearchPageBloc(EbooksModelImplMock());
    });

    ///call on submit button
    ///two steps call must need some duration
    test('search query result book test',() async{
      _bloc?.onSubmittedFunction('flutter');
      await Future.delayed(Duration(milliseconds: 100));
      expect(_bloc?.books?.contains(getEBooksMock().first), true);
    });


  });
}