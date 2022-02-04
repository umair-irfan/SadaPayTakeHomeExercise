//
//  TrendingRepoTableViewCellViewModel.swift
//  TakeHomeExercise
//
//  Created by Umair Irfan on 29/06/2021.
//

import Foundation

protocol TrendingRepoTableViewCellViewModelType {
    func getRespostryName() -> String
    func getOwnerName() -> String
    func getStarsCount()-> String
    func getUserImage()-> String
}

class TrendingRepoTableViewCellViewModel: TrendingRepoTableViewCellViewModelType {
   
    private let repo : Items!
    
    init(with repo: Items) {
        self.repo = repo
    }
    
    func getRespostryName() -> String { repo.full_name ?? "" }
    func getOwnerName() -> String { repo.owner?.login ?? "" }
    func getStarsCount()-> String { "⭐️ \(repo.stargazers_count ?? 0)" }
    func getUserImage()-> String { repo.owner?.avatar_url ?? "" }
    
}
