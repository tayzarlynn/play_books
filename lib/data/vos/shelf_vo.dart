import 'package:hive/hive.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/persistence/constant.dart';

part 'shelf_vo.g.dart';

@HiveType(typeId: SHELF_HIVE_TYPE_ID, adapterName: 'ShelfVOAdapter')
class ShelfVO {
  @HiveField(0)
  String? uniqueID;

  @HiveField(1)
  String? name;

  @HiveField(2)
  List<BookVO>? bookList;

  ShelfVO({this.uniqueID,this.name, this.bookList});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShelfVO &&
          runtimeType == other.runtimeType &&
          uniqueID == other.uniqueID &&
          name == other.name;

  @override
  int get hashCode => uniqueID.hashCode ^ name.hashCode;
}
