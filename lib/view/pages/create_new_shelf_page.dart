import 'package:flutter/material.dart';
import 'package:play_books/bloc/create_new_shelf_bloc.dart';
import 'package:play_books/view/resources/dimens.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class CreateNewShelfPage extends StatelessWidget {
  final String? uniqueID;

  CreateNewShelfPage({this.uniqueID});

  CreateNewShelfBloc getProvider(BuildContext context) {
    return Provider.of<CreateNewShelfBloc>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
     // create: (context) => CreateNewShelfBloc(uniqueID),
      value: CreateNewShelfBloc(uniqueID),
      child: Scaffold(
        body: SafeArea(
          child: Material(
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: MARGIN_MEDIUM_2,
                vertical: MARGIN_MEDIUM_3,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Builder(
                    builder: (context) => IconButton(
                      key: Key('Shelf Done'),
                      onPressed: () {
                        if (getProvider(context).controller.text.isNotEmpty) {
                          getProvider(context).createShelf(context)
                              .then((_) => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyApp(
                                        index: 1,
                                      ),
                                    ),
                                    (e) => false,
                                  ));
                        }
                      },
                      icon: Icon(
                        Icons.done,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) => TextField(
                      key: Key('Shelf Text Field'),
                      autofocus: true,
                      controller: getProvider(context).controller,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: TEXT_REGULAR_3X,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Shelf name',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: TEXT_REGULAR_3X,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
