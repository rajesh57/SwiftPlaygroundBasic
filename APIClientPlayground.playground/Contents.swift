//: Playground - noun: a place where people can play

// From That Thing in Swift
// https://thatthinginswift.com

import UIKit
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

class ClientAPI {
    
    func login(email: String, password: String, completion: @escaping (_ success: Bool, _ message: String?) -> ()) {
        let loginObject = ["email": email, "password": password]

        post(request: clientURLRequest(path: "auth/local", params: loginObject as Dictionary<String, AnyObject>?)) { (success, object) -> () in

          //  dispatch_get_main_queue().asynchronously(execute: { () -> Void in
                if success {
                    completion(true, nil)
                } else {
                    var message = "there was an error"
                    if let object = object, let passedMessage = object["message"] as? String {
                        message = passedMessage
                    }
                    completion(true, message)
                }
          //  })
        }
    }

    // MARK: private composition methods

    private func post(request: NSMutableURLRequest, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        dataTask(request: request, method: "POST", completion: completion)
    }

    private func put(request: NSMutableURLRequest, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        dataTask(request: request, method: "PUT", completion: completion)
    }

    private func get(request: NSMutableURLRequest, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        dataTask(request: request, method: "GET", completion: completion)
    }

    private func dataTask(request: NSMutableURLRequest, method: String, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        request.httpMethod = method

        let session = URLSession(configuration: URLSessionConfiguration.default)

        session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                if let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode {
                    completion(true, json as AnyObject?)
                } else {
                    completion(false, json as AnyObject?)
                }
            }
        }.resume()
    }

    private func clientURLRequest(path: String, params: Dictionary<String, AnyObject>? = nil) -> NSMutableURLRequest {
        let request = NSMutableURLRequest(url: NSURL(string: "http://api.example.com/"+path)! as URL)
        
        return request
    }
}

let client = ClientAPI()
client.login(email: "name@example.com", password: "password") { (success, message) -> () in
    if success {
        print("logged in successfully!")
    } else {
        print("there was an error:", message)
    }

    XCPlaygroundPage.currentPage.finishExecution()
}

