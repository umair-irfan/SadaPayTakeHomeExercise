//
//  TrendingRepositoryViewModel.swift
//  TakeHomeExercise
//
//  Created by Umair Irfan on 29/06/2021.
//

import Foundation

protocol TrendingRepositoryViewModelType {
    func getScreenTitle() -> String
    func tableViewCellForRowAt(for indexPath: IndexPath) -> TrendingRepoTableViewCellViewModelType?
    func tableViewLoadingCellForRowAt(for indexPath: IndexPath) -> LoadingTableViewCellViewModelType?
    func tableViewNumberOfRows()-> Int
    func requestTrendingRepo()
    func generateCellViewModels()
    var reloadTableViewClosure: (()->())? { get set }
    var showNetworkErrorClosure: (()->())? { get set }
}


class TrendingRepositoryViewModel: TrendingRepositoryViewModelType {
    
    //MARK: Properties
    private var respository: GithubTrendingRepositoryType
    lazy var cellViewModels : [TrendingRepoTableViewCellViewModelType]? = [TrendingRepoTableViewCellViewModelType]()
    lazy var loadingCellViewModels : [LoadingTableViewCellViewModelType]? = [LoadingTableViewCellViewModelType]()
    private var trendingRepos = [Items]()
    var reloadTableViewClosure: (()->())?
    var showNetworkErrorClosure: (()->())?
    
    //MARK: Initializer
    init(respository: GithubTrendingRepositoryType) {
        self.respository = respository
    }
    
    func getScreenTitle() -> String { return "Trending" }
    
    func tableViewCellForRowAt(for indexPath: IndexPath) -> TrendingRepoTableViewCellViewModelType? {
        return cellViewModels?[indexPath.row]
    }
    func tableViewLoadingCellForRowAt(for indexPath: IndexPath) -> LoadingTableViewCellViewModelType? {
        loadingCellViewModels?.append(LoadingTableViewCellViewModel())
        return loadingCellViewModels?[indexPath.row]
    }
    func tableViewNumberOfRows()-> Int {  cellViewModels?.count ??  0 }
    func generateCellViewModels() {
        cellViewModels = self.trendingRepos.compactMap { TrendingRepoTableViewCellViewModel(with: $0) }
        reloadTableViewClosure?()
        
    }
}

//MARK: Fetch Data
extension TrendingRepositoryViewModel {
    func requestTrendingRepo() {
        respository.getTrendingRespositories { result in
            switch result {
            case .success(let data):
                self.trendingRepos = data?.items ?? []
                self.generateCellViewModels()
            case .failure:
                print("Failure")
                self.showNetworkErrorClosure?() 
            }
        }
    }
}
