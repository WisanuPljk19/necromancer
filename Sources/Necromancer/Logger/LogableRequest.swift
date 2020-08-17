//
//  LogableRequest.swift
//  
//
//  Created by Wisanu Paunglumjeak on 17/8/2563 BE.
//

import Foundation
import Alamofire
import SwiftyBeaver

let release = "Release"

public struct ResponseInfo{
    public var httpResponse: HTTPURLResponse?
    public var data: Data?
    public var error: Error?
    public var elapsedTime: TimeInterval
    
    public init(httpResponse: HTTPURLResponse?, data: Data?, error: Error?, elapsedTime: TimeInterval) {
        self.httpResponse = httpResponse
        self.data = data
        self.error = error
        self.elapsedTime = elapsedTime
    }
}
public protocol LoggeableRequest: AnyObject {
    
    var request: URLRequest? { get }
    
    func fetchResponseInfo(completion: @escaping (ResponseInfo) -> Void)
}
extension LoggeableRequest {
    
    public func logging() -> Self {
        
        #if RELEASE
            return self
        #endif
        
        Logger.logRequest(request: request)
        fetchResponseInfo { (response) in
            Logger.logResponse(request: self.request, response: response)
        }
        
        return self
    }
}
extension DataRequest: LoggeableRequest {
    public func fetchResponseInfo(completion: @escaping (ResponseInfo) -> Void) {
        
        responseData { (response) in
            
            var error: Error? = nil
            if case .failure(let e) = response.result {
                error = e
            }
            let logResponse = ResponseInfo(httpResponse: response.response,
                                           data: response.data,
                                           error: error,
                                           elapsedTime:  response.serializationDuration)
            completion(logResponse)
        }
        
    }
}
extension DownloadRequest: LoggeableRequest {
    public func fetchResponseInfo(completion: @escaping (ResponseInfo) -> Void) {
        
        responseData { (response) in
            
            var error: Error? = nil
            var data: Data? = nil
            
            switch response.result {
            case let .success(value):
                data = value
            case let .failure(value):
                error = value
            }
            
            let logResponse = ResponseInfo(httpResponse: response.response,
                                           data: data,
                                           error: error,
                                           elapsedTime:  response.serializationDuration)
            completion(logResponse)
        }
    }
}
