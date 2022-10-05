//
//  NetworkRequest.swift
//  BooksApp
//
//  Created by SarathKumar S on 29/09/22.
//

import Foundation

/// API Base url constants
struct APIConstants {
    static let baseUrl = "run.mocky.io"
}

// MARK: - HTTP Headers
public enum HTTPHeader {
    case contentType(String)
    case accept(String)
    case authorization(String)
    case custom(String, String)
    
    var header: (field: String, value: String) {
        switch self {
        case .contentType(let value): return (field: "Content-Type", value: value)
        case .accept(let value): return (field: "Accept", value: value)
        case .authorization(let value): return (field: "Authorization", value: value)
        case .custom(let key, let value): return (field: key, value: value)
        }
    }
}

// MARK: - http methods
enum HTTPMethods: String {
    case GET
    case POST
    case PUT
    case DELETE
    case PATCH
    
    /// HTTP Method as Strings
    var value: String {
        return self.rawValue
    }
}

// MARK: - HTTPRequest protocol
protocol HTTPRequest {
    /// scheme
    var scheme: String { get }
    /// base URL
    var baseURL: String { get }
    /// API endpoint
    var path: String { get }
    /// API Params
    var parameters: [URLQueryItem]? { get }
    /// API method
    var method: String { get }
    /// API header
    var headers: [HTTPHeader]? { get }
    /// Data
    var data: Data? { get }

}

// MARK: - HTTPRequest protocol extension
extension HTTPRequest {
    
    /// default scheme will be https
    var scheme: String {
        switch self {
        default:
            return "https"
        }
    }

    /// default base url
    var baseURL: String {
        return APIConstants.baseUrl
    }
    
    /// default method will be GET
    var method: String {
        switch self {
        default:
            return HTTPMethods.GET.value
        }
    }
    
    /// default nil parameters passing
    var parameters: [URLQueryItem]? {
        switch self {
        default:
            return nil
        }
    }
    
    // Headers for API
    var headers: [HTTPHeader]? {
        switch self {
        default:
            return [
                HTTPHeader.accept("application/json"),
                HTTPHeader.contentType("application/json")
            ]
        }
    }
    
    /// default nil data passing
    var data: Data? {
        switch self {
        default:
            return nil
        }
    }
}
