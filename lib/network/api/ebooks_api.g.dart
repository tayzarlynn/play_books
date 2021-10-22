// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ebooks_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _EbooksAPI implements EbooksAPI {
  _EbooksAPI(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.nytimes.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BooksListResponse> getEbooksList(apiKey, date) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'api-key': apiKey,
      r'published_date': date
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BooksListResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/svc/books/v3/lists/overview.json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BooksListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BooksListByNameResponse> getEbooksListByList(
      listNameEncoded, apiKey) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'api-key': apiKey};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BooksListByNameResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options,
                    '/svc/books/v3/lists/current/$listNameEncoded.json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BooksListByNameResponse.fromJson(_result.data!);
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
