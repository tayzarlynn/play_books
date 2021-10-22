import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:play_books/bloc/ebook_detail_bloc.dart';
import 'package:play_books/data/vos/book_vo.dart';
import 'package:play_books/view/resources/dimens.dart';
import 'package:provider/provider.dart';

class EBookDetailPage extends StatelessWidget {
  final String primaryIsbn10;
  EBookDetailPage(this.primaryIsbn10);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
     // create: (context) => EbookDetailBloc(primaryIsbn10),
      value: EbookDetailBloc(primaryIsbn10),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            key: Key('detailBack'),
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: Selector<EbookDetailBloc,BookVO?>(
          selector: (context,bloc)=>bloc.book,
          builder: (context,book,child)=>SingleChildScrollView(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BookCoverAndTitleView(book),
                  const SizedBox(
                    height: MARGIN_MEDIUM_3,
                  ),
                  RatingAndCategoryView(),
                  const SizedBox(
                    height: MARGIN_MEDIUM_3,
                  ),
                  FreeAndBuyView(),
                  const SizedBox(
                    height: MARGIN_MEDIUM_3,
                  ),
                  DescriptionView(book),
                  const SizedBox(
                    height: MARGIN_MEDIUM_3,
                  ),
                  RatingsAndReviews()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RatingsAndReviews extends StatelessWidget {
  const RatingsAndReviews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ratings and reviews',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: TEXT_REGULAR_3X,
          ),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM_3,
        ),
        Row(
          children: [
            Text(
              '4.0',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: TEXT_BIG_1X,
              ),
            ),
            const SizedBox(
              width: MARGIN_XX_LARGE,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RatingBar.builder(
                  initialRating: 4,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: MARGIN_MEDIUM_3,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.blue,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                const SizedBox(
                  height: MARGIN_MEDIUM_2,
                ),
                Text('33 total'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class BookCoverAndTitleView extends StatelessWidget {
  final BookVO? bookVO;

  BookCoverAndTitleView(this.bookVO);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          color: Colors.black,
          height: MediaQuery.of(context).size.height * 0.28,
          width: MediaQuery.of(context).size.width * 0.39,
          imageUrl: '${bookVO?.bookImage}',
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
          width: MARGIN_MEDIUM_2,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${bookVO?.title.toString()}',
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: TEXT_HEADING_1X,
                ),
              ),
              const SizedBox(
                height: MARGIN_MEDIUM,
              ),
              Text(
                '${bookVO?.author}',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: TEXT_REGULAR_2X,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: MARGIN_MEDIUM,
              ),
              Text('Sold by ${bookVO?.publisher ?? 'Unknown'}'),
            ],
          ),
        )
      ],
    );
  }
}

class RatingAndCategoryView extends StatelessWidget {
  const RatingAndCategoryView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '2.6',
                    style: TextStyle(
                      fontSize: TEXT_REGULAR_3X,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(Icons.star),
                ],
              ),
              const SizedBox(
                height: MARGIN_SMALL,
              ),
              Text('5 reviews')
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Icon(Icons.book_outlined),
              const SizedBox(
                height: MARGIN_SMALL,
              ),
              Text('Ebook')
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Text(
                '320',
                style: TextStyle(
                  fontSize: TEXT_REGULAR_3X,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: MARGIN_SMALL,
              ),
              Text('Pages')
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Icon(Icons.home_repair_service_outlined),
              const SizedBox(
                height: MARGIN_SMALL,
              ),
              Text('Eligible'),
            ],
          ),
        ),
      ],
    );
  }
}

class DescriptionView extends StatelessWidget {
  final BookVO? bookVO;

  DescriptionView(this.bookVO);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About this ebook',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: TEXT_REGULAR_3X,
          ),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        Text(
          bookVO?.description ?? 'Unknown',
          style: TextStyle(
            fontSize: TEXT_REGULAR_2X,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}

class FreeAndBuyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(MARGIN_SMALL),
              border: Border.all(color: Colors.black26, width: 1),
            ),
            child: Center(
              child: Text(
                'Free sample',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(49, 121, 196, 1.0),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: MARGIN_MEDIUM,
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              color: Color.fromRGBO(49, 121, 196, 1.0),
              borderRadius: BorderRadius.circular(MARGIN_SMALL),
              border: Border.all(color: Colors.black26, width: 1),
            ),
            child: Center(
              child: Text(
                'Buy',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
