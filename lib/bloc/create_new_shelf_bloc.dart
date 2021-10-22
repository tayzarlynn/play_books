import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play_books/data/model/ebooks_model.dart';
import 'package:play_books/data/model/ebooks_model_impl.dart';
import 'package:play_books/data/vos/shelf_vo.dart';
import 'package:uuid/uuid.dart';

import '../main.dart';

class CreateNewShelfBloc extends ChangeNotifier {
  ///model
   EbooksModel _model = EbooksModelImpl();
  final TextEditingController controller = TextEditingController();

  ///uuid
  final Uuid uuid = Uuid();

  String? uniqueID;
  String? editID;
  ShelfVO? shelf;

  CreateNewShelfBloc(editID,[EbooksModel? ebooksModelMock]) {
    ///for unit testing
    if(ebooksModelMock!=null) _model = ebooksModelMock;
    ///create new shelf
    uniqueID = uuid.v1();

    ///edit shelf
    if (editID != null) {
      this.editID = editID;
    }
  }

  Future createShelf(BuildContext context) {
    if (editID != null) {
      return _model.updateShelf(this.editID.toString(), controller.text);
    } else {
      ShelfVO shelf = ShelfVO(uniqueID: uniqueID, name: controller.text);
      return _model.createShelf(uniqueID!, shelf);
    }
  }
}
