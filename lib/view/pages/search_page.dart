import 'package:flutter/material.dart';
import 'package:play_books/bloc/search_page_bloc.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:provider/provider.dart';

import 'all_ebooks_search_result_page.dart';

class SearchPage extends StatelessWidget {
  SearchPageBloc getProvider(BuildContext context) {
    return Provider.of<SearchPageBloc>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
     // create: (context) => SearchPageBloc(),
      value: SearchPageBloc(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Builder(
            builder: (context) => TextField(
              key: Key('searchBar'),
              autofocus: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: 'Type Here',
              ),
              onSubmitted: (queryText) {
                ///to ask why need builder
                getProvider(context).onSubmittedFunction(queryText);
              },
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.clear,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: Selector<SearchPageBloc, bool>(
          selector: (context, bloc) => bloc.isSearch,
          builder: (context, isSearch, child) =>
              Selector<SearchPageBloc, List<BookVO>?>(
            selector: (context, bloc) => bloc.books,
            builder: (context, books, child) => (isSearch == true)
                ? ((books?.isNotEmpty == true) && (books?.length ?? 0) > 0)
                    ? AllEbooksSearchResultPage(books)
                    : Center(
                        child: CircularProgressIndicator(),
                      )
                : Container(),
          ),
        ),
      ),
    );
  }
}
