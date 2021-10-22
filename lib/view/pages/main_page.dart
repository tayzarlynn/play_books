import 'package:flutter/material.dart';
import 'package:play_books/bloc/main_page_bloc.dart';
import 'package:play_books/view/resources/strings.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  final int bottomNavigationIndex;

  MainPage(this.bottomNavigationIndex);

  MainPageBloc getProvider(BuildContext context) {
    return Provider.of<MainPageBloc>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
     // create: (context) => MainPageBloc(bottomNavigationIndex),
      value:MainPageBloc(bottomNavigationIndex),
      child: Consumer<MainPageBloc>(
        builder: (context, bloc, child) => Scaffold(
          backgroundColor: Colors.white,
          body: bloc.widgetList.elementAt(bloc.index),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: bloc.index,
            items: [
              BottomNavigationBarItem(
                label: EBOOKS,
                icon: Icon(Icons.home_outlined),
              ),
              BottomNavigationBarItem(
                label: LIBRARY,
                icon: Icon(Icons.library_books_outlined),
              ),
            ],
            onTap: (index) {
              bloc.onTapBottomNavigation(index);
            },
          ),
        ),
      ),
    );
  }
}
