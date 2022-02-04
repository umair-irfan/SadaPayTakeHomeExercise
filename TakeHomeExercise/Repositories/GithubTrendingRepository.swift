//
//  GithubTrendingRepository.swift
//  TakeHomeExercise
//
//  Created by Umair Irfan on 30/06/2021.
//

import Foundation

protocol GithubTrendingRepositoryType {
    func getTrendingRespositories(completion: @escaping(Result<TrendingRepoResponse?,Errors>)-> Void)
}

class GithubTrendingRepository: GithubTrendingRepositoryType {
    func getTrendingRespositories(completion: @escaping(Result<TrendingRepoResponse?,Errors>)-> Void) {
        ServiceManager().fetchTrendingRespostries(for: "language=+sort:stars", completion: completion)
    }
}

class GithubTrendingRepositoryMock: GithubTrendingRepositoryType {
    func getTrendingRespositories(completion: @escaping(Result<TrendingRepoResponse?,Errors>)-> Void) {
       //completion(.success("Here goes the Mock Data"))
    }
}
