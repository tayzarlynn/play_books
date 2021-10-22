import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:play_books/bloc/add_to_shelf_bloc.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/data/vos/shelf_vo.dart';
import 'package:play_books/view/resources/dimens.dart';
import 'package:play_books/view/widgets/shelf_item.dart';
import 'package:provider/provider.dart';

class AddToShelfPage extends StatelessWidget {
  final BookVO book;

  AddToShelfPage(this.book);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
     // create: (context) => AddToShelfBloc(book),
      value:  AddToShelfBloc(book),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            key: Key('shelfBack'),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Add to shelf',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Selector<AddToShelfBloc, List<ShelfVO>?>(
          selector: (context, bloc) => bloc.shelfList,
          builder: (context, shelfList, child) => ListView.separated(
              padding: const EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM_2, vertical: MARGIN_MEDIUM_2),
              itemBuilder: (BuildContext context, int index) => ShelfItem(
                    shelf: shelfList?[index],
                    onTapShelf: () {
                      AddToShelfBloc _bloc =
                          Provider.of(context, listen: false);
                      _bloc
                          .addBookToShelf(
                              context, shelfList?[index].uniqueID ?? '')
                          .then((_) => Fluttertoast.showToast(
                              msg: 'Done',
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.SNACKBAR,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.blueAccent,
                              textColor: Colors.white,
                              fontSize: 16.0));
                    },
                  ),
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                    height: MARGIN_MEDIUM_3,
                  ),
              itemCount: shelfList?.length ?? 0),
        ),
      ),
    );
  }
}
