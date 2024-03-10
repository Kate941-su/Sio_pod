//
//  File.swift
//
//
//  Created by KaitoKitaya on 2024/03/09.
//

import Foundation

public enum ResponseType {
  /// Transform the response data to JSON object only when the
  /// content-type of response is "application/json" .
  /// The type will be [String: Any]
  case json

  /// Transform the response data to an UTF-8 encoded String.
  case string

  /// Get the original bytes, the [Response.data] will be Data.
  case data

  /// Get the response stream directly,
  /// the [Response.data] will be [ResponseBody].
  ///
  /// ```dart
  /// Response<ResponseBody> rs = await Dio().get<ResponseBody>(
  ///   url,
  ///   options: Options(responseType: ResponseType.stream),
  /// );
  ///  case stream, // after v1
}
