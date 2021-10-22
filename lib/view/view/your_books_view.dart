import 'package:flutter/material.dart';
import 'package:play_books/bloc/your_book_view_bloc.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/view/layout/list_layout.dart';
import 'package:play_books/view/layout/three_column_grid_layout.dart';
import 'package:play_books/view/layout/two_column_grid_layout.dart';
import 'package:play_books/view/resources/constant.dart';
import 'package:play_books/view/resources/dimens.dart';
import 'package:play_books/view/widgets/horizontal_toggle_button.dart';
import 'package:play_books/view/widgets/selected_toggle_button.dart';
import 'package:provider/provider.dart';

import '../../dummy_data.dart';

class YourBooksView extends StatelessWidget {
  YourBookViewBloc getProvider(BuildContext context) {
    return Provider.of(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      // create: (context) => YourBookViewBloc(),
      value: YourBookViewBloc(),
      child: Container(
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: MARGIN_MEDIUM_3,
            ),
            HorizontalToggleButtonSelectionView(),
            const SizedBox(
              height: MARGIN_MEDIUM_3,
            ),
            Selector<YourBookViewBloc, RadioText>(
              selector: (context, bloc) => bloc.radioGroupValue,
              builder: (context, radioGroupValue, child) =>
                  Selector<YourBookViewBloc, LayoutText>(
                selector: (context, bloc) => bloc.layoutText,
                builder: (context, layoutText, child) =>
                    Selector<YourBookViewBloc, List<BookVO>?>(
                  selector: (context, bloc) => bloc.books,
                  builder: (context, books, child) =>
                      SortAndChangeLayoutButtons(
                    onTapSortByButton: () =>
                        getProvider(context).showSortByBottomSheet(context),
                    onTapChangeLayoutButton: () =>
                        getProvider(context).changeLayoutView(context),
                    sortByText: setSortByText(context, radioGroupValue),
                    layoutText: setLayoutText(layoutText),
                    layoutIcons: setLayoutIcons(layoutText),
                    layoutView: setLayoutView(layoutText, books),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String setSortByText(BuildContext context, RadioText radioGroupValue) {
    if (radioGroupValue == RadioText.Author) {
      getProvider(context).getLibraryEbooksFromDatabaseWithAuthor();
      return 'Author';
    } else if (radioGroupValue == RadioText.Recent) {
      return 'Recent';
    } else {
      getProvider(context).getLibraryEbooksFromDatabaseWithTitle();
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
    return ListLayout(books: books);
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
      mainAxisSize: MainAxisSize.min,
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
                  key: Key('changeLayout'),
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
        layoutView,
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

class HorizontalToggleButtonSelectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: MARGIN_MEDIUM),
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 1,
                color: Colors.black12,
              ),
            ),
            child: Icon(
              Icons.close,
            ),
          ),
          const SizedBox(
            width: MARGIN_MEDIUM,
          ),
          SelectedToggleButton(toggleButtonDummyData),
          const SizedBox(
            width: MARGIN_MEDIUM,
          ),
          HorizontalToggleButton(toggleButtonDummyData),
          const SizedBox(
            width: MARGIN_MEDIUM,
          ),
          HorizontalToggleButton(toggleButtonDummyData),
          const SizedBox(
            width: MARGIN_MEDIUM,
          ),
          HorizontalToggleButton(toggleButtonDummyData),
        ],
      ),
    );
  }
}
