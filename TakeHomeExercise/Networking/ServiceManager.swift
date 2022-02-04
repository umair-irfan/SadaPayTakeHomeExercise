//
//  ServiceManager.swift
//  TakeHomeExercise
//
//  Created by Umair Irfan on 30/06/2021.
//

import Foundation

protocol ServiceManagerType {
    func fetchTrendingRespostries(for querry:String, completion: @escaping(Result<TrendingRepoResponse?,Errors>) -> Void)
}

class ServiceManager: ServiceManagerType {
    private let service: NetworkClient = APIClient()
    
    func fetchTrendingRespostries(for querry:String, completion: @escaping(Result<TrendingRepoResponse?,Errors>) -> Void) {
        let request = TrendingRespostriesRequest(query: querry)
        let router = Router.fetchTrendingRepo(request)
        service.requestNetwork(router: router) { (result:Result<TrendingRepoResponse, Errors>) in
            switch result{
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
