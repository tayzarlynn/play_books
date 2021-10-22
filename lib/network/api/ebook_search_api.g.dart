// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ebook_search_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _EbookSearchAPI implements EbookSearchAPI {
  _EbookSearchAPI(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.googleapis.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BookSearchResponse> getBookSearch(queryValue) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'q': queryValue};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BookSearchResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/books/v1/volumes',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BookSearchResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
