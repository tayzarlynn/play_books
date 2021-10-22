import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:play_books/data/vos/book_search_result.dart';
import 'package:play_books/view/pages/search_page.dart';
import 'package:play_books/view/resources/dimens.dart';
import 'package:play_books/view/resources/strings.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
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
                controller: _controller,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                  // showSearch(
                  //     context: context,
                  //     delegate: SearchData(),
                  //     query: _controller.text);
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

// class SearchData extends SearchDelegate<String> {
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           query = '';
//         },
//         icon: Icon(Icons.clear),
//       ),
//     ];
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           close(context, '');
//         },
//         icon: Icon(Icons.arrow_back));
//   }
//
//
//
//   void _navigateToBookDetail(BuildContext context, BookVO bookVO) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => EBookDetailPage(bookVO),
//       ),
//     );
//   }
//
//   void _navigateToAllEBookPage(
//       BuildContext context, List<BookSearchResult> bookSearchResults) {
//     List<BookVO> books = bookSearchResults.map((e) => (e.volumeInfo)).toList();
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => TwoColumnGridLayout(
//           books: books,
//           onTapBook: (bookVO) => _navigateToBookDetail(context, bookVO),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // TODO: implement buildSuggestions
//     // return ListView.separated(
//     //     itemBuilder: (BuildContext context, int index) =>
//     //         SearchSuggestionItem(dummyTitle[index], dummyDescription[index]),
//     //     separatorBuilder: (BuildContext context, int index) => const SizedBox(
//     //           height: MARGIN_MEDIUM,
//     //         ),
//     //     itemCount: toggleButtonDummyData.length);
//     return Container();
//   }
// }

///for audio book search result
class SearchResultAudioBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CachedNetworkImage(
          width: MediaQuery.of(context).size.height * 0.1,
          height: MediaQuery.of(context).size.height * 0.13,
          imageUrl:
              'https://images-na.ssl-images-amazon.com/images/I/41AH5E3YoPL._SY344_BO1,204,203,200_QL70_ML2_.jpg',
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1),
                ),
              ],
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fill,
              ),
            ),
          ),
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        const SizedBox(width: MARGIN_MEDIUM_2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'This is the book title',
              style: TextStyle(
                fontSize: TEXT_REGULAR_3X,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: MARGIN_MEDIUM),
            Text('This is the book title'),
          ],
        )
      ],
    );
  }
}

class SearchSuggestionItem extends StatelessWidget {
  final String titleText, descriptionText;
  const SearchSuggestionItem(this.titleText, this.descriptionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(top: MARGIN_MEDIUM_2, left: MARGIN_MEDIUM_2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CachedNetworkImage(
            color: Colors.black,
            width: MediaQuery.of(context).size.height * 0.05,
            height: MediaQuery.of(context).size.height * 0.07,
            imageUrl:
                'https://images-na.ssl-images-amazon.com/images/I/41AH5E3YoPL._SY344_BO1,204,203,200_QL70_ML2_.jpg',
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          const SizedBox(
            width: MARGIN_MEDIUM_3,
          ),
          Column(
            children: [
              Text(titleText),
              Text(descriptionText),
            ],
          ),
        ],
      ),
    );
  }
}

///for ebook search result
// class SearchResultTitleAndEbooksHorizontalView extends StatelessWidget {
//   final List<BookSearchResult> bookSearchResults;
//   final Function(List<BookSearchResult>) onTapTitleAndArrow;
//   final Function(BookVO) onTapBook;
//
//   SearchResultTitleAndEbooksHorizontalView(
//       this.bookSearchResults, this.onTapTitleAndArrow, this.onTapBook);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         TitleAndArrowView(bookSearchResults, onTapTitleAndArrow),
//         const SizedBox(
//           height: MARGIN_MEDIUM_2,
//         ),
//         Container(
//           height: MediaQuery.of(context).size.height * 0.4,
//           child: ListView.separated(
//               padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (BuildContext context, int index) {
//                 return GestureDetector(
//                   onTap: () {
//                     onTapBook(bookSearchResults[index].volumeInfo);
//                   },
//                   child: SearchResultEBook(bookSearchResults[index]),
//                 );
//               },
//               separatorBuilder: (BuildContext context, int index) {
//                 return const SizedBox(
//                   width: MARGIN_MEDIUM,
//                 );
//               },
//               itemCount: bookSearchResults.length),
//         ),
//       ],
//     );
//   }
// }

class TitleAndArrowView extends StatelessWidget {
  final List<BookSearchResult> bookSearchResult;
  final Function(List<BookSearchResult>) onTapTitleAndArrow;

  TitleAndArrowView(this.bookSearchResult, this.onTapTitleAndArrow);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapTitleAndArrow(bookSearchResult);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
        child: Row(
          children: [
            Text(
              'Books',
              style: TextStyle(
                fontSize: TEXT_REGULAR_3X,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
