import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play_books/bloc/ebook_page_bloc.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/data/vos/books_list_vo.dart';
import 'package:play_books/view/pages/search_page.dart';
import 'package:play_books/view/resources/dimens.dart';
import 'package:play_books/view/resources/strings.dart';
import 'package:play_books/view/view/audio_books_tab_bar_view.dart';
import 'package:play_books/view/view/ebooks_tab_bar_view.dart';
import 'package:play_books/view/widgets/carousel_ebook.dart';
import 'package:provider/provider.dart';

import 'all_audio_books_page.dart';
import 'all_ebooks_page.dart';
import 'ebook_detail_page.dart';

class EbooksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      // create: (context)=>EbookPageBloc(),
      value: EbookPageBloc(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: DefaultTabController(
            length: 2,
            child: NestedScrollView(
              key: Key('scroll'),
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    expandedHeight: MediaQuery.of(context).size.width * 1,
                    floating: true,
                    backgroundColor: Colors.white,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: MARGIN_MEDIUM_2,
                          ),
                          SearchBar(
                            () => _navigateToSearchPage(context),
                          ),
                          const SizedBox(
                            height: MARGIN_MEDIUM_2,
                          ),
                          Selector<EbookPageBloc, List<BookVO>?>(
                            selector: (context, bloc) => bloc.books,
                            builder: (context, books, child) =>
                                CarouselView(books, (book) {
                              EbookPageBloc _bloc =
                                  Provider.of(context, listen: false);
                              _bloc.onTapCarousel(context, book);
                            }),
                          ),
                          const SizedBox(
                            height: MARGIN_MEDIUM_3,
                          ),
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
                                child: Text(EBOOKS),
                              ),
                              Tab(
                                child: Text(AUDIO_BOOKS),
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
                children: [
                  Selector<EbookPageBloc, List<BooksListVO>?>(
                    selector: (context, bloc) => bloc.booksList,
                    builder: (context, booksList, child) =>
                        ((booksList?.length ?? 0) > 0)
                            ? EbooksTabBarView(
                                booksList!,
                                (listName, listNameEncoded) =>
                                    _navigateToAllBooks(
                                        context, listName, listNameEncoded),
                                (name) => _navigateToBookDetail(context, name),
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              ),
                  ),
                  AudioBooksTabBarView(
                      () => _navigateToAllAudioBooks(context), () {}
                      //() => _navigateToBookDetail(),
                      ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToSearchPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchPage(),
      ),
    );
  }

  ///navigate to ebook detail and all ebooks pages
  void _navigateToAllBooks(
      BuildContext context, String listName, String listNameEncoded) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AllEBooksPage(listName, listNameEncoded),
      ),
    );
  }

  void _navigateToBookDetail(BuildContext context, String name) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EBookDetailPage(name),
      ),
    );
  }

  ///for audiobook
  void _navigateToAllAudioBooks(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AllAudioBooksPage(),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final Function onTapSearchBar;

  SearchBar(this.onTapSearchBar);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          left: MARGIN_MEDIUM_2, right: MARGIN_MEDIUM_2, top: MARGIN_MEDIUM_2),
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
            child: Icon(
              Icons.search,
              size: 28,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
              child: TextField(
                key: Key('onTapSearchBar'),
                onTap: () {
                  onTapSearchBar();
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: SEARCH_BAR_TEXT,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: MARGIN_MEDIUM_2),
            child: CachedNetworkImage(
              height: 40,
              width: 40,
              imageUrl:
                  'https://www.himalmag.com/wp-content/uploads/2019/07/sample-profile-picture.png',
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ],
      ),
    );
  }
}

class CarouselView extends StatelessWidget {
  final List<BookVO>? books;
  final Function(BookVO) onTapCarouse;

  CarouselView(this.books, this.onTapCarouse);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.65,
      child: (books?.isNotEmpty == true)
          ? CarouselSlider.builder(
              itemCount: books?.length,
              itemBuilder:
                  (BuildContext context, int index, int pageViewIndex) =>
                      CarouselEbook(books?[index], onTapCarouse, index),
              options: CarouselOptions(
                height: MediaQuery.of(context).size.width * 0.6,
                viewportFraction: 0.45,
                initialPage: 0,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                scrollDirection: Axis.horizontal,
              ),
            )
          : Container(),
    );
  }
}
