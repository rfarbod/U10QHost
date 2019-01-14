//
//  WebServices.swift
//  Uneed
//
//  Created by Sina Khalili on 7/8/18.
//  Copyright © 2018 Uneed. All rights reserved.
//

import Reachability
import Alamofire
import Arrow

typealias Success              = (_ response: JResponse) -> ()
typealias Failure              = (_ response: JResponse) -> ()

struct WebServices {

    static func isConnected(failure: Failure? = nil) -> Bool {
        // checking connection
        if (Reachability.init()!.connection == .none) {
            failure?(JResponse.notConnected)
            return false
        }
        return true
    }
    
    static func request(url: String,
                        method: HTTPMethod = .post,
                        params: [String: Any] = [:],
                        files: [MFileToSend] = [],
                        resultType: ArrowParsable.Type? = nil,
                        success: Success?, failure: Failure?, retriesLeft: Int = 0) {
        
        // response function
        func responseJSON(response: DataResponse<Any>) {
            print(response.response?.statusCode)
            print(response.result.value)
            var jResponse = JResponse(resultType.self)
            jResponse.parse(response.result.value)
            
            if jResponse.code == .success {
                success?(jResponse)
            } else {
                if response.error?.localizedDescription == "cancelled" {
                    return
                }
                if retriesLeft > 0 && jResponse.code == .app_serverDown {
                    request(url: url, method: method, params: params, resultType: resultType, success: success, failure: failure, retriesLeft: retriesLeft - 1)
                } else {
                    failure?(jResponse)
                }
            }
        }
    
        print("URL: \(url)")
        print("params: \(params)")
        let headers: [String: String] = ["t": Constants.token ?? "_"]
        print(headers)

        if files.count == 0 {
            // normal request
            Alamofire.request(url, method: method, parameters: params, encoding: JSONEncoding.default, headers: headers)
                .responseJSON { response in
                    responseJSON(response: response)
            }
        } else {
            // multi-part upload file!
            Alamofire.upload(multipartFormData: { multipartFormData in
                for file in files {
                    multipartFormData.append(file.data, withName: file.key, fileName: file.fileName, mimeType: file.mimetype)
                }
                for (key, value) in params {
                    if value is String || value is Int {
                        multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key)
                    }
                }
            }, to: url, method: .post, headers: headers, encodingCompletion: { (result) in
                switch result {
                case .success(let upload, _, _):
                    
                    upload.uploadProgress(closure: { (progress) in
                        print("Upload Progress: \(progress.fractionCompleted)")
                    })
                    
                    upload.responseJSON { response in
                        responseJSON(response: response)
                    }
                    
                case .failure(let _):
                    failure?(JResponse.noResponse)
                }
            })
        }
    }
    static func cancelRequests(_ url: String) {
        Alamofire.SessionManager.default.session.getTasksWithCompletionHandler
            {
                (dataTasks, uploadTasks, downloadTasks) -> Void in
                
                Alamofire.SessionManager.cancelTasksByUrl(dataTasks     as [URLSessionTask], url: url)
                Alamofire.SessionManager.cancelTasksByUrl(uploadTasks   as [URLSessionTask], url: url)
                Alamofire.SessionManager.cancelTasksByUrl(downloadTasks as [URLSessionTask], url: url)
        }
    }
}
extension Alamofire.SessionManager
{
    // cancel tasks by url
    fileprivate static func cancelTasksByUrl(_ tasks: [URLSessionTask], url: String)
    {
        for task in tasks
        {
            let hasPrefix = task.currentRequest?.url?.description.hasPrefix(url)
            if hasPrefix != nil && hasPrefix! == true
            {
                task.cancel()
            }
        }
    }
}
