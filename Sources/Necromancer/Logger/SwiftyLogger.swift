//
//  SwiftyLogger.swift
//  
//
//  Created by Wisanu Paunglumjeak on 17/8/2563 BE.
//

import Foundation
import SwiftyBeaver

private let nullString = "(null)"

public var Log:SwiftyBeaver.Type = {
    var logger = SwiftyBeaver.self
    let console = ConsoleDestination()
    console.format = "$DHH:mm:ss.SSS$d $C$L$c $N.$F:$l - $M"
    logger.addDestination(console)
    return logger
}()

internal struct Logger {
    
    internal static func logRequest(request: URLRequest?) {
        
        guard let request = request else {
            return
        }
        
        let method = request.httpMethod!
        let url = request.url?.absoluteString ?? nullString
        let headers = prettyPrintedString(from: request.allHTTPHeaderFields) ?? nullString
        Log.info("""
            
            ********** START REQUEST **********
            
            [URL] -> \(url)
            [Method] -> \(method)
            [Header]
            \(headers)
            
            [Body]
            \(string(from: request.httpBody, prettyPrint: true) ?? nullString)
            
            ********** END REQUEST **********
            """)
    }
    
    internal static func logResponse(request: URLRequest?, response: ResponseInfo){
        let httpResponse = response.httpResponse
        let data = response.data
        let elapsedTime = response.elapsedTime
        let error = response.error
        
        if request == nil && response.httpResponse == nil {
            return
        }
        
        // request
        let requestMethod = request?.httpMethod ?? nullString
        let requestUrl = request?.url?.absoluteString ?? nullString
        
        // response
        let responseStatusCode = httpResponse?.statusCode ?? 0
        let responseHeaders = prettyPrintedString(from: httpResponse?.allHeaderFields) ?? nullString
        let responseData = string(from: data, prettyPrint: true) ?? nullString
        
        // time
        let elapsedTimeString = String(format: "[%.4f s]", elapsedTime)
        
        // log
        let success = (error == nil)
        let responseTitle = success ? "Response" : "Response Error"
        
        if responseStatusCode >= 400 {
            Log.error("""

            ********** START RESPONSE **********

            [\(responseTitle)] -> \(responseStatusCode)
            [URL] -> \(requestUrl) \(elapsedTimeString)
            [Method] -> \(requestMethod)
            [Header]
            \(responseHeaders)

            [Body]
            \(responseData)

            ********** END RESPONSE **********
            """)
        } else {
            Log.info("""
            
            ********** START RESPONSE **********
            
            [\(responseTitle)] -> \(responseStatusCode)
            [URL] -> \(requestUrl) \(elapsedTimeString)
            [Method] -> \(requestMethod)
            [Header]
            \(responseHeaders)
            
            [Body]
            \(responseData)
            
            ********** END RESPONSE **********
            """)
        }
        
        
        
    }
    
    // MARK: - Private helpers
    private static func string(from data: Data?, prettyPrint: Bool) -> String? {
        guard let data = data else {
            return nil
        }
        var response: String? = nil
        if prettyPrint,
            let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let prettyString = prettyPrintedString(from: json) {
            response = prettyString
        }
        else if let dataString = String.init(data: data, encoding: .utf8) {
            response = dataString
        }
        return response
    }
    private static func prettyPrintedString(from json: Any?) -> String? {
        guard let json = json else {
            return nil
        }
        var response: String? = nil
        if let data = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted),
            let dataString = String.init(data: data, encoding: .utf8) {
            response = dataString.replacingOccurrences(of: "\\/", with: "/")
        }
        return response
    }
}
