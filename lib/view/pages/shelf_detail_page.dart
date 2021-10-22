import 'package:flutter/material.dart';
import 'package:play_books/bloc/shelf_detail_bloc.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/data/vos/shelf_vo.dart';
import 'package:play_books/view/layout/list_layout.dart';
import 'package:play_books/view/layout/three_column_grid_layout.dart';
import 'package:play_books/view/layout/two_column_grid_layout.dart';
import 'package:play_books/view/resources/constant.dart';
import 'package:play_books/view/resources/dimens.dart';
import 'package:play_books/view/view/empty_shelf_view.dart';
import 'package:provider/provider.dart';

class ShelfDetailPage extends StatelessWidget {
  final String id;
  ShelfDetailPage(this.id);

  ShelfDetailBloc getProvider(BuildContext context) {
    return Provider.of<ShelfDetailBloc>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      // create: (context) => ShelfDetailBloc(id),
      value: ShelfDetailBloc(id),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
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
                Icons.search,
                color: Colors.black,
              ),
            ),
            Builder(
              builder: (BuildContext context) => Padding(
                padding: const EdgeInsets.only(right: MARGIN_MEDIUM),
                child: PopupMenuButton<PopupMenuShelf>(
                  key: Key('shelf menu'),
                  onSelected: (PopupMenuShelf selectedMenu) {
                    ShelfDetailBloc _bloc =
                        Provider.of<ShelfDetailBloc>(context, listen: false);
                    _bloc.popupMenuSelectedFunction(context, selectedMenu);
                  },
                  child: Icon(
                    Icons.more_vert_outlined,
                    color: Colors.black,
                  ),
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem<PopupMenuShelf>(
                        key: Key('shelf rename'),
                        value: PopupMenuShelf.RenameShelf,
                        child: Text('Rename shelf'),
                      ),
                      PopupMenuItem<PopupMenuShelf>(
                        key: Key('shelf delete'),
                        value: PopupMenuShelf.DeleteShelf,
                        child: Text('Delete shelf'),
                      ),
                    ];
                  },
                ),
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Selector<ShelfDetailBloc, ShelfVO?>(
              selector: (context, bloc) => bloc.shelf,
              builder: (context, shelf, child) => ShelfTitleAndBookCount(shelf),
            ),
            const SizedBox(
              height: 1,
            ),
            Selector<ShelfDetailBloc, RadioText>(
              selector: (context, bloc) => bloc.radioGroupValue,
              builder: (context, radioGroupValue, child) =>
                  Selector<ShelfDetailBloc, LayoutText>(
                selector: (context, bloc) => bloc.layoutText,
                builder: (context, layoutText, child) => Selector<
                        ShelfDetailBloc, List<BookVO>?>(
                    selector: (context, bloc) => bloc.books,
                    builder: (context, books, child) =>
                        ((books?.length ?? 0) > 0)
                            ? Expanded(
                                child: ShelfBooksView(
                                  onTapSortByButton: () => getProvider(context)
                                      .showSortByBottomSheet(context),
                                  onTapChangeLayoutButton: () =>
                                      getProvider(context)
                                          .changeLayoutView(context),
                                  sortByText:
                                      setSortByText(context, radioGroupValue),
                                  layoutText: setLayoutText(layoutText),
                                  layoutIcons: setLayoutIcons(layoutText),
                                  layoutView: setLayoutView(layoutText, books),
                                ),
                              )
                            : EmptyShelfView()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String setSortByText(BuildContext context, RadioText radioGroupValue) {
    if (radioGroupValue == RadioText.Author) {
      getProvider(context).getShelfEbookFromDatabaseWithAuthor(id);
      return 'Author';
    } else if (radioGroupValue == RadioText.Recent) {
      return 'Recent';
    } else {
      getProvider(context).getShelfEbookFromDatabaseWithTitle(id);
      return 'Title';
    }
  }

  String setLayoutText(LayoutText layoutText) {
    if (layoutText == LayoutText.ThreeGrid) {
      return 'ThreeGrid';
    } else if (layoutText == LayoutText.TwoGrid) {
      return 'TwoGrid';
    }
    return 'List';
  }

  Icon setLayoutIcons(LayoutText layoutText) {
    if (layoutText == LayoutText.ThreeGrid) {
      return Icon(Icons.grid_view);
    } else if (layoutText == LayoutText.TwoGrid) {
      return Icon(Icons.grid_on_outlined);
    }
    return Icon(Icons.list);
  }

  Widget setLayoutView(LayoutText layoutText, List<BookVO>? books) {
    if (layoutText == LayoutText.ThreeGrid) {
      return ThreeColumnGridLayout(
        books: books,
      );
    } else if (layoutText == LayoutText.TwoGrid) {
      return TwoColumnGridLayout(
        physics: NeverScrollableScrollPhysics(),
        books: books,
        onTapBook: (title) {},
      );
    }
    return ListLayout(
      books: books,
    );
  }
}

class ShelfTitleAndBookCount extends StatelessWidget {
  final ShelfVO? shelf;

  ShelfTitleAndBookCount(this.shelf);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_3),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            shelf!.name.toString(),
            style: TextStyle(
              fontSize: TEXT_REGULAR_3X,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Text('${shelf?.bookList!.length ?? 0} Book'),
        ],
      ),
    );
  }
}

class ShelfBooksView extends StatelessWidget {
  final Function onTapSortByButton, onTapChangeLayoutButton;
  final String sortByText, layoutText;
  final Icon layoutIcons;
  final Widget layoutView;

  ShelfBooksView(
      {required this.onTapSortByButton,
      required this.onTapChangeLayoutButton,
      required this.sortByText,
      required this.layoutText,
      required this.layoutIcons,
      required this.layoutView});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          const SizedBox(
            height: MARGIN_MEDIUM_3,
          ),
          SortAndChangeLayoutButtons(
            layoutText: layoutText,
            layoutIcons: layoutIcons,
            onTapSortByButton: onTapSortByButton,
            layoutView: layoutView,
            sortByText: sortByText,
            onTapChangeLayoutButton: onTapChangeLayoutButton,
          ),
        ],
      ),
    );
  }
}

class SortAndChangeLayoutButtons extends StatelessWidget {
  final Function onTapSortByButton, onTapChangeLayoutButton;
  final String sortByText, layoutText;
  final Icon layoutIcons;
  final Widget layoutView;

  SortAndChangeLayoutButtons(
      {required this.onTapSortByButton,
      required this.onTapChangeLayoutButton,
      required this.sortByText,
      required this.layoutText,
      required this.layoutIcons,
      required this.layoutView});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  onTapSortByButton();
                },
                child: Row(
                  children: [
                    Text(
                      'Sort by: $sortByText',
                      style: TextStyle(
                        fontSize: TEXT_REGULAR,
                      ),
                    ),
                    const SizedBox(
                      width: MARGIN_SMALL,
                    ),
                    Icon(
                      Icons.align_horizontal_left,
                    ),
                  ],
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  onTapChangeLayoutButton();
                },
                child: Row(
                  children: [
                    Text(
                      layoutText,
                      style: TextStyle(
                        fontSize: TEXT_REGULAR,
                      ),
                    ),
                    const SizedBox(
                      width: MARGIN_SMALL,
                    ),
                    layoutIcons,
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MARGIN_MEDIUM_3,
        ),
        Container(
          child: layoutView,
        ),
      ],
    );
  }
}

class ChangeLayoutButton extends StatelessWidget {
  final Function onTapChangeLayoutButton;
  final String layoutText;

  ChangeLayoutButton(
      {required this.onTapChangeLayoutButton, required this.layoutText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapChangeLayoutButton();
      },
      child: Row(
        children: [
          Text(
            layoutText,
            style: TextStyle(
              fontSize: TEXT_REGULAR,
            ),
          ),
          const SizedBox(
            width: MARGIN_SMALL,
          ),
          Icon(
            Icons.grid_on_outlined,
          ),
        ],
      ),
    );
  }
}

class SortByButton extends StatelessWidget {
  final Function onTapSortByButton;
  final String sortByText;

  SortByButton({required this.onTapSortByButton, required this.sortByText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapSortByButton();
      },
      child: Row(
        children: [
          Text(
            'Sort by: $sortByText',
            style: TextStyle(
              fontSize: TEXT_REGULAR,
            ),
          ),
          const SizedBox(
            width: MARGIN_SMALL,
          ),
          Icon(
            Icons.align_horizontal_left,
          ),
        ],
      ),
    );
  }
}
