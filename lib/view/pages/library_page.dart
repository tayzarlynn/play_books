import 'package:flutter/material.dart';
import 'package:play_books/view/resources/dimens.dart';
import 'package:play_books/view/resources/strings.dart';
import 'package:play_books/view/view/your_books_view.dart';
import 'package:play_books/view/view/your_shelves_view.dart';

import 'ebooks_page.dart';


class LibraryPage extends StatelessWidget {
  final int? tabIndex;

  LibraryPage({required this.tabIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 2,
        initialIndex: tabIndex?.toInt() ?? 0,
        child: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [
                SliverAppBar(
                  expandedHeight: 84,
                  pinned: true,
                  floating: true,
                  backgroundColor: Colors.white,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      children: [
                        SearchBar((){}),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(MARGIN_MEDIUM_3),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        TabBar(
                          indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(
                                width: MARGIN_SMALL, color: Colors.blue),
                            insets: EdgeInsets.symmetric(horizontal: 40),
                          ),
                          unselectedLabelColor: Colors.black,
                          labelColor: Colors.blueAccent,
                          tabs: [
                            Tab(
                              child: Text(YOUR_BOOKS),
                            ),
                            Tab(
                              child: Text(YOUR_SHELVES),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              // children: [YourBooksView(), YourShelvesView()],
              children: [YourBooksView(),  YourShelvesView()],
            ),
          ),
        ),
      ),
    );
  }
}
