import 'package:flutter/foundation.dart';

class ResponseState {
  final dynamic response;
  final bool? isLoading;
  final bool? isError;
  final String? errorMessage;

  ResponseState(
      {this.response, this.isLoading, this.errorMessage, this.isError});

  ResponseState.initial()
      : response = [],
        isLoading = false,
        errorMessage = '',
        isError = false;

  ResponseState copyWith({
    dynamic response,
    bool? isLoading,
    bool? isError,
    String? errorMessage,
  }) {
    return ResponseState(
        response: response ?? this.response,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        isError: isError ?? this.isError);
  }

  @override
  String toString() =>
      'ResponseState(response: $response, isLoading: $isLoading, errorMessage: $errorMessage, isError: $isError)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ResponseState &&
        listEquals(o.response, response) &&
        o.isLoading == isLoading &&
        o.errorMessage == errorMessage &&
        o.isError == isError;
  }

  @override
  int get hashCode =>
      response.hashCode ^
      isLoading.hashCode ^
      errorMessage.hashCode ^
      isError.hashCode;
}
