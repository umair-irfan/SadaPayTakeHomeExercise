//
//  TrendingRepositoryRouter.swift
//  TakeHomeExercise
//
//  Created by Umair Irfan on 29/06/2021.
//

import Foundation

struct BaseUrl {
    static var host = "api.github.com"
}

public protocol URLRequestConvertible {
    func asURLRequest()  -> URLRequest?
}

enum Router<T>: URLRequestConvertible {
    
    case fetchTrendingRepo(T)
    
    private var scheme: String {
        switch self {
        case .fetchTrendingRepo:
            return "https"
        }
    }
    private var host: String {
        switch self {
        case .fetchTrendingRepo:
            return BaseUrl.host
        }
    }
    private var path: String {
        switch self {
        case .fetchTrendingRepo:
            return  "/search/repositories"
        }
    }
    private var method: String {
        switch self {
        case .fetchTrendingRepo:
            return "GET"
        }
    }
    private var queryParameters: [URLQueryItem]? {
        switch self {
        case .fetchTrendingRepo(let params):
            let request = params as! TrendingRespostriesRequest
            return [URLQueryItem(name: "q", value: String(request.query))]
        }
    }
    func asURLRequest() -> URLRequest? {
        var components = URLComponents()
        components.queryItems = queryParameters
        components.scheme = self.scheme
        components.host = self.host
        components.path = self.path
        guard let url = components.url else {
            assert(true,"Unable to compose URL..")
            return nil
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = self.method
        return urlRequest
    }
}
