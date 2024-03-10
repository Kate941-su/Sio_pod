//
//  File.swift
//
//
//  Created by KaitoKitaya on 2024/03/09.
//

import Foundation

public enum StatusCode: Int {
  case continuous = 100
  case switching_protocols = 101
  case processing = 102
  case ok = 200
  case created = 201
  case accepted = 202
  case no_content = 204
  case partial_content = 206
  case multiple_choices = 300
  case moved_permanently = 301
  case found = 302
  case not_modified = 304
  case temporary_redirect = 307
  case permanent_redirect = 308
  case bad_request = 400
  case unauthorized = 401
  case forbidden = 403
  case not_found = 404
  case method_not_allowed = 405
  case request_timeout = 408
  case too_many_requests = 429
  case internal_server_error = 500
  case not_implemented = 501
  case bad_gateway = 502
  case service_unavailable = 503
  case gateway_timeout = 504
  case http_version_not_supported = 505

  public var name: String {
    switch self {
    case .continuous:
      return "Continue"
    case .switching_protocols:
      return "Switching Protocols"
    case .processing:
      return "Processing"
    case .ok:
      return "OK"
    case .created:
      return "Created"
    case .accepted:
      return "Accepted"
    case .no_content:
      return "No Content"
    case .partial_content:
      return "Partial Content"
    case .multiple_choices:
      return "Multiple Choices"
    case .moved_permanently:
      return "Moved Permanently"
    case .found:
      return "Found"
    case .not_modified:
      return "Not Modified"
    case .temporary_redirect:
      return "Temporary Redirect"
    case .permanent_redirect:
      return "Permanent Redirect"
    case .bad_request:
      return "Bad Request"
    case .unauthorized:
      return "Unauthorized"
    case .forbidden:
      return "Forbidden"
    case .not_found:
      return "Not Found"
    case .method_not_allowed:
      return "Method Not Allowed"
    case .request_timeout:
      return "Request Timeout"
    case .too_many_requests:
      return "Too Many Requests"
    case .internal_server_error:
      return "Internal Server Error"
    case .not_implemented:
      return "Not Implemented"
    case .bad_gateway:
      return "Bad Gateway"
    case .service_unavailable:
      return "Service Unavailable"
    case .gateway_timeout:
      return "Gateway Timeout"
    case .http_version_not_supported:
      return "HTTP Version Not Supported"
    }
  }

}
