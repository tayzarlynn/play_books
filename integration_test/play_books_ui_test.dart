import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:integration_test/integration_test.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/data/vos/books_list_vo.dart';
import 'package:play_books/data/vos/image_links_vo.dart';
import 'package:play_books/data/vos/shelf_vo.dart';
import 'package:play_books/main.dart';
import 'package:play_books/persistence/constant.dart';
import 'package:play_books/view/pages/ebooks_page.dart';
import 'package:play_books/view/pages/library_page.dart';
import 'package:play_books/view/pages/main_page.dart';

import 'test_data.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(BooksListVOAdapter());
  Hive.registerAdapter(BookVOAdapter());
  Hive.registerAdapter(ImageLinksVOAdapter());
  Hive.registerAdapter(ShelfVOAdapter());

  await Hive.openBox<BooksListVO>(BOOKS_LIST_BOX_NAME);
  await Hive.openBox<BookVO>(BOOK_VO_BOX_NAME);
  await Hive.openBox<BookVO>(BOOK_VO_LIBRARY_BOX_NAME);
  await Hive.openBox<ShelfVO>(SHELF_VO_BOX_NAME);

  // testWidgets('use case one', (WidgetTester tester) async {
  //   ///load the whole app UI
  //   await tester.pumpWidget(MyApp());
  //   await Future.delayed(Duration(seconds: 2));
  //   await tester.pumpAndSettle(Duration(seconds: 3));
  //
  //   ///use one unit testing
  //   ///find main page
  //   expect(find.byType(MainPage), findsOneWidget);
  //
  //   ///find ebooks page
  //   expect(find.byType(EbooksPage), findsOneWidget);
  //
  //   ///find ebook title text widget
  //   expect(find.text(USE_CASE_ONE_BOOK_TITLE), findsOneWidget);
  //
  //   ///tap to detail page
  //   await tester.ensureVisible(find.text(USE_CASE_ONE_BOOK_TITLE));
  //   await tester.pumpAndSettle();
  //   await tester.tap(find.text(USE_CASE_ONE_BOOK_TITLE));
  //   await tester.pumpAndSettle(Duration(seconds: 3));
  //
  //   ///checking two text widget title and author
  //   expect(find.text(USE_CASE_ONE_BOOK_TITLE), findsOneWidget);
  //   expect(find.text(USE_CASE_ONE_BOOK_AUTHOR), findsOneWidget);
  //
  //   ///tap back button
  //   await tester.tap(find.byKey(Key('detailBack')));
  //   await tester.pumpAndSettle(Duration(seconds: 5));
  //
  //   ///tap library page
  //   await tester.tap(find.text('Library'));
  //   await tester.pumpAndSettle(Duration(seconds: 5));
  //
  //   ///tap change layout
  //   await tester.tap(find.byKey(Key('changeLayout')));
  //   await tester.pumpAndSettle(Duration(seconds: 3));
  //   await tester.tap(find.byKey(Key('changeLayout')));
  //   await tester.pumpAndSettle(Duration(seconds: 3));
  // });

  // testWidgets('use case two', (WidgetTester tester) async {
  //   ///load the whole app UI
  //   await tester.pumpWidget(MyApp());
  //   await Future.delayed(Duration(seconds: 2));
  //   await tester.pumpAndSettle(Duration(seconds: 3));
  //
  //   ///tap search bar
  //   await tester.tap(find.byKey(Key('onTapSearchBar')));
  //   await tester.pumpAndSettle(Duration(seconds: 3));
  //
  //   ///type text and enter search bar
  //   await tester.enterText(find.byKey(Key('searchBar')), USE_CASE_TWO_QUERY_TEXT);
  //
  //   ///mimic enter
  //   await tester.testTextInput.receiveAction(TextInputAction.done);
  //   await tester.pumpAndSettle(Duration(seconds: 5));
  //
  //   ///checking flutter book title and author
  //   await tester.pumpAndSettle(Duration(seconds: 5));
  //   expect(find.text(USE_CASE_TWO_FLUTTER_BOOK_TITLE), findsOneWidget);
  //   await tester.pumpAndSettle(Duration(seconds: 5));
  //   expect(find.text(USE_CASE_TWO_FLUTTER_BOOK_AUTHOR), findsOneWidget);
  // });

  testWidgets('use case three and four', (WidgetTester tester) async {
    ///load the whole app UI
    await tester.pumpWidget(MyApp());
    await Future.delayed(Duration(seconds: 2));
    await tester.pumpAndSettle(Duration(seconds: 3));

    ///tap library page
    await tester.tap(find.text('Library'));
    await tester.pumpAndSettle(Duration(seconds: 5));

    ///tap your shelves page
    await tester.tap(find.text('Your shelves'));
    await tester.pumpAndSettle(Duration(seconds: 5));

    ///tap create new
    await tester.tap(find.byKey(Key('Create')));
    await tester.pumpAndSettle(Duration(seconds: 5));

    ///verify text field
    expect(find.byKey(Key('Shelf Text Field')), findsOneWidget);
    await tester.pumpAndSettle(Duration(seconds: 5));

    ///enter shelf name in text field
    await tester.enterText(find.byKey(Key('Shelf Text Field')), USE_CASE_THREE_SHELF_NAME);

    ///tap done button
    await tester.tap(find.byKey(Key('Shelf Done')));
    await tester.pumpAndSettle(Duration(seconds: 5));

    ///verify shelf
    expect(find.text(USE_CASE_THREE_SHELF_NAME), findsOneWidget);
    await tester.pumpAndSettle(Duration(seconds: 5));

    ///tap ebooks tab
    await tester.tap(find.text('Ebooks'));
    await tester.pumpAndSettle(Duration(seconds: 5));

    ///tap ebook
    await tester.ensureVisible(find.text(USE_CASE_ONE_BOOK_TITLE));
    await tester.pumpAndSettle();
    await tester.tap(find.text(USE_CASE_ONE_BOOK_TITLE));
    await tester.pumpAndSettle(Duration(seconds: 3));

    ///tap back button
    await tester.tap(find.byKey(Key('detailBack')));
    await tester.pumpAndSettle(Duration(seconds: 5));

    ///tap scroll
    await tester.drag(find.byKey(Key('scroll')), const Offset(0.0, 1000));
    await tester.pumpAndSettle(Duration(seconds: 5));

    ///tap carousel ebook menu
    await tester.tap(find.byKey(Key('menu')));
    await tester.pumpAndSettle(Duration(seconds: 5));

    ///tap add to shelf
    await tester.tap(find.byKey(Key('add to shelf')));
    await tester.pumpAndSettle(Duration(seconds: 5));

    ///add  book to shelf
    await tester.tap(find.text(USE_CASE_THREE_SHELF_NAME));
    await tester.pumpAndSettle(Duration(seconds: 5));

    ///back to ebooks page
    await tester.tap(find.byKey(Key('shelfBack')));
    await tester.pumpAndSettle(Duration(seconds: 5));

    ///tap library page
    await tester.tap(find.text('Library'));
    await tester.pumpAndSettle(Duration(seconds: 5));

    ///tap shelf detail
    await tester.tap(find.text(USE_CASE_THREE_SHELF_NAME));
    await tester.pumpAndSettle(Duration(seconds: 5));

    ///tap shelf menu
    await tester.tap(find.byKey(Key('shelf menu')));
    await tester.pumpAndSettle(Duration(seconds: 5));

    ///tap shelf rename
    await tester.tap(find.byKey(Key('shelf rename')));
    await tester.pumpAndSettle(Duration(seconds: 5));

    ///enter shelf rename in text field
    await tester.enterText(find.byKey(Key('Shelf Text Field')), USE_CASE_THREE_SHELF_RENAME);

    ///tap done button
    await tester.tap(find.byKey(Key('Shelf Done')));
    await tester.pumpAndSettle(Duration(seconds: 5));

    ///tap shelf detail
    await tester.tap(find.text(USE_CASE_THREE_SHELF_RENAME));
    await tester.pumpAndSettle(Duration(seconds: 5));

    ///tap shelf menu
    await tester.tap(find.byKey(Key('shelf menu')));
    await tester.pumpAndSettle(Duration(seconds: 5));

    ///tap shelf rename
    await tester.tap(find.byKey(Key('shelf delete')));
    await tester.pumpAndSettle(Duration(seconds: 5));

    ///tap delete shelf
    await tester.tap(find.byKey(Key('shelf deleted')));
    await tester.pumpAndSettle(Duration(seconds: 5));
  });
}
