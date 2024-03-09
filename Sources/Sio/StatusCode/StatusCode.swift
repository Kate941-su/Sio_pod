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
      return "Continue"
    case .processing:
      return "Continue"
    case .ok:
      return "Continue"
    case .created:
      return "Continue"
    case .accepted:
      return "Continue"
    case .no_content:
      return "Continue"
    case .partial_content:
      return "Continue"
    case .multiple_choices:
      return "Continue"
    case .moved_permanently:
      return "Continue"
    case .found:
      return "Continue"
    case .not_modified:
      return "Continue"
    case .temporary_redirect:
      return "Continue"
    case .permanent_redirect:
      return "Continue"
    case .bad_request:
      return "Continue"
    case .unauthorized:
      return "Continue"
    case .forbidden:
      return "Continue"
    case .not_found:
      return "Continue"
    case .method_not_allowed:
      return "Continue"
    case .request_timeout:
      return "Continue"
    case .too_many_requests:
      return "Continue"
    case .internal_server_error:
      return "Continue"
    case .not_implemented:
      return "Continue"
    case .bad_gateway:
      return "Continue"
    case .service_unavailable:
      return "Continue"
    case .gateway_timeout:
      return "Continue"
    case .http_version_not_supported:
      return "Continue"
    }
  }
  
}
