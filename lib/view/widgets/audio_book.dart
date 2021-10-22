import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:play_books/view/resources/dimens.dart';

class AudioBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.43,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            color: Colors.black,
            height: MediaQuery.of(context).size.height * 0.23,
            imageUrl:
                'https://www.rd.com/wp-content/uploads/2019/11/GettyImages-1217398832-2.jpg',
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
            height: MARGIN_SMALL,
          ),
          Text(
            'The Product Book for Flutter Dev',
            maxLines: 1,
          ),
          Text(
            'Jeff Thymus Joe ',
            style: TextStyle(
              fontSize: TEXT_REGULAR,
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
