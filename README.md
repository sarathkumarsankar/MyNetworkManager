# MyNetworkManager

This package contains network source code 

How to use:


## Step 1. Set the base url: 

/* Example code snippet: */

APIConstants.baseUrl = "{base url}"

## Step 2. Create url request with URLRequest: 

/* Example code snippet: */

/// Enum for service endpoints
enum YourServiceEndpoints {
    case getBooks
}

/// Extension for  service request
extension yourServiceEndpoints: HTTPRequest {
    var path: String {
        switch self {
        case .getBooks:
            return "{end points}"
        }
    }
}

## Step 3. Call the networkmanager shared instance 

/* Example code snippet: */

let urlRequest = BooServiceEndpoints.getBooks
NetworkManager.shared.excute(with: urlRequest, type: {Your decodable model}.self) { result in
    switch result {
    case .success(let result):
        completionHandler(.success(result))
    case .failure(let error):
        completionHandler(.failure(error))
    }
}
