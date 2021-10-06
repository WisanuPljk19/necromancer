//
//  SwiftyLogger.swift
//  
//
//  Created by Wisanu Paunglumjeak on 17/8/2563 BE.
//

import Foundation
import SwiftyBeaver
import Alamofire

private let nullString = "(null)"

public var Log: SwiftyBeaver.Type = {
    var logger = SwiftyBeaver.self
    let console = ConsoleDestination()
    console.format = "$DHH:mm:ss.SSS$d $C$L$c $N.$F:$l - $M"
    logger.addDestination(console)
    return logger
}()

public class NetworkActivityLogger {
    
    public static let shared = NetworkActivityLogger()
    
    private let queue = DispatchQueue(label: "\(NetworkActivityLogger.self) Queue")
    
    private init() {
        print("1")
        print("2")
        print("3")
    }
    
    deinit {
        unsubscribeNetworkActivity()
    }
    
    public func setup(){
        Log.info("Setup NetworkActivityLogger")
        #if RELEASE
        return self
        #endif
        subscribeNetworkActivity()
    }
    
    private func subscribeNetworkActivity(){
        Log.info("NetworkActivityLogger subscribeNetworkActivity")
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(
            self,
            selector: #selector(NetworkActivityLogger.onRequest(notification:)),
            name: Request.didResumeNotification,
            object: nil
        )

        notificationCenter.addObserver(
            self,
            selector: #selector(NetworkActivityLogger.onResponse(notification:)),
            name: Request.didFinishNotification,
            object: nil
        )
    }
    
    private func unsubscribeNetworkActivity () {
        Log.info("NetworkActivityLogger unsubscribeNetworkActivity")
        #if RELEASE
        return self
        #endif
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func onRequest(notification: Notification){
        guard let dataRequest = notification.request as? DataRequest,
            let request = dataRequest.convertible.urlRequest else {
                return
        }
        
        let method = request.httpMethod!
        let url = request.url?.absoluteString ?? nullString
        let headers = prettyPrintedHeaderString(from: request.allHTTPHeaderFields)
        Log.info("""
            
            ------------------------------------------
                           LOGGER REQUEST
                        --------------------
            
            [\(method)] \(url)
            
            ~HEADER~
            \(headers)
            
            ~BODY~
            \(string(from: request.httpBody, prettyPrint: true))
            
            ------------------------------------------
            """)
    }
    
    @objc private func onResponse(notification: Notification){
        guard let dataRequest = notification.request as? DataRequest,
            let task = dataRequest.task,
            let metrics = dataRequest.metrics,
            let request = task.originalRequest,
            let httpMethod = request.httpMethod,
            let requestURL = request.url,
            let response = task.response as? HTTPURLResponse else {
                return
        }
        
        let elapsedTime = metrics.taskInterval.duration
        Log.info("""
            
            ------------------------------------------
                         LOGGER RESPONSE
                         ---------------
            ~STATUS CODE~
            \(response.statusCode) ⏳ \(String(format: "%.04f", elapsedTime)) SEC
            
            [\(httpMethod)] \(requestURL)
            
            ~HEADER~
            \(prettyPrintedHeaderString(from: response.allHeaderFields as? [String : String]))
            
            ~BODY~
            \(string(from: dataRequest.data, prettyPrint: true))
            
            ------------------------------------------
            """)
        
    }
    
    // MARK: - Private helpers
    private func string(from data: Data?, prettyPrint: Bool) -> String {
        var response = ""
        guard let data = data else {
            return response
        }
        
        if prettyPrint, let json = try? JSONSerialization.jsonObject(with: data, options: []) {
            response = prettyPrintedString(from: json)
        }else if let dataString = String.init(data: data, encoding: .utf8) {
            response = dataString
        }
        return response
    }
    
    private func prettyPrintedString(from json: Any?) -> String {
        var response = ""
        guard let json = json else {
            return response
        }
        
        if let data = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted),
            let dataString = String.init(data: data, encoding: .utf8) {
            response = dataString.replacingOccurrences(of: "\\/", with: "/")
        }
        return response
    }
    
    private func prettyPrintedHeaderString(from dic: [String: String]?) -> String {
        guard let dic = dic else {
            return ""
        }
        var headers = [String]()
        dic.forEach { (key, value) in
            headers.append("\"\(key)\": \"\(value)\"")
        }
        return "[\n\t" + headers.joined(separator: ",\n\t") + "\n]"
    }
}
