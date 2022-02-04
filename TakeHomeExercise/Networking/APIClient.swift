//
//  APIClient.swift
//  TakeHomeExercise
//
//  Created by Umair Irfan on 29/06/2021.
//

import Foundation

public protocol NetworkClient {
    func requestNetwork<T:Codable>(router: URLRequestConvertible, completionHandler: @escaping (Result<T,Errors>) -> Void)
}

public class APIClient {
  
    private let session = URLSession(configuration: .default)
    
    private func fetchData(request : URLRequest?, completion:@escaping (Result<Data,Errors>) -> Void) {
        guard let url = request?.url else {
            let error = Errors(error: "Invalid URL..")
            completion(.failure(error))
            return
        }
        print("Reuest: ", url)
        let task = session.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let data = data {
                completion(.success(data))
            } else if let error = error {
                completion(.failure(Errors.init(error: error.localizedDescription)))
            }
        }
        task.resume()
        
    }
}
extension APIClient: NetworkClient {
    public func requestNetwork<T:Codable>(router: URLRequestConvertible, completionHandler: @escaping (Result<T,Errors>) -> Void) {
        self.fetchData(request: router.asURLRequest()) { result in
            switch result {
            case .success(let data):
                do {
                    //print(String(decoding: data, as: UTF8.self))
                    let decode = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(.success(decode))
                }catch let error{
                    completionHandler(.failure(Errors(error:error.localizedDescription)))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
