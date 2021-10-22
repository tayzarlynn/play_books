import 'package:flutter/material.dart';
import 'package:play_books/bloc/your_shelves_view_bloc.dart';
import 'package:play_books/data/vos/shelf_vo.dart';
import 'package:play_books/view/pages/create_new_shelf_page.dart';
import 'package:play_books/view/pages/shelf_detail_page.dart';
import 'package:play_books/view/resources/dimens.dart';
import 'package:play_books/view/widgets/shelf_item.dart';
import 'package:provider/provider.dart';

class YourShelvesView extends StatelessWidget {
  YourShelvesViewBloc getProvider(BuildContext context) {
    return Provider.of<YourShelvesViewBloc>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      //  create: (context) => YourShelvesViewBloc(),
      value: YourShelvesViewBloc(),
      child: Stack(
        children: [
          Selector<YourShelvesViewBloc, List<ShelfVO>?>(
            selector: (context, bloc) => bloc.shelfList,
            builder: (context, shelfList, child) => ListView.separated(
                padding: const EdgeInsets.symmetric(
                    horizontal: MARGIN_MEDIUM_2, vertical: MARGIN_MEDIUM_2),
                itemBuilder: (BuildContext context, int index) => ShelfItem(
                    onTapShelf: () {
                      navigateToShelfDetail(
                          context, shelfList?[index].uniqueID ?? '');
                    },
                    shelf: shelfList?[index]),
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                      height: MARGIN_MEDIUM_3,
                    ),
                itemCount: shelfList?.length ?? 0),
          ),
          CreateNewButton(() => navigateToCreateShelf(context)),
        ],
      ),
    );
  }

  void navigateToCreateShelf(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateNewShelfPage()),
    );
  }

  void navigateToShelfDetail(BuildContext context, String id) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ShelfDetailPage(id)),
    );
  }
}

class CreateNewButton extends StatelessWidget {
  final Function onTapCreateShelf;

  CreateNewButton(this.onTapCreateShelf);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('tap');
        onTapCreateShelf();
      },
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          key: Key('Create'),
          margin: const EdgeInsets.only(bottom: MARGIN_MEDIUM_3),
          width: 190,
          height: 60,
          decoration: BoxDecoration(
            color: Color.fromRGBO(49, 121, 196, 1.0),
            borderRadius: BorderRadius.circular(MARGIN_XX_LARGE),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 4,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: ListTile(
              leading: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              title: Text(
                'Create new',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
