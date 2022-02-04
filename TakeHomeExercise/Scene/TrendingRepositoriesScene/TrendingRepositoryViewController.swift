//
//  TrendingRepositoryViewController.swift
//  TakeHomeExercise
//
//  Created by Umair Irfan on 29/06/2021.
//

import UIKit

class TrendingRepositoryViewController: UIViewController, StoryboardInitializable {

    //MARK: View
    @IBOutlet private var repoTableView: UITableView!
    @IBOutlet private var errorView: NetworkErrorView!
    
    //MARK: Properties
    var viewModel: TrendingRepositoryViewModelType!
    private var isLoading: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel.requestTrendingRepo()
        bindViewModel()
    }

}

//MARK: View Setup

extension TrendingRepositoryViewController {
    func setupView(){
        self.title = viewModel.getScreenTitle()
        repoTableView.dataSource = self
        repoTableView.delegate = self
        repoTableView.register(UINib(nibName: "TrendingRepoTableViewCell", bundle: nil), forCellReuseIdentifier: TrendingRepoTableViewCell.reuseableIdentifier)
        repoTableView.register(UINib(nibName: "LoadingTableViewCell", bundle: nil), forCellReuseIdentifier: LoadingTableViewCell.reuseableIdentifier)
    }
    
    func bindViewModel(){
        self.viewModel.reloadTableViewClosure = { [weak self] in
            DispatchQueue.main.async {
                self?.isLoading = false
                self?.repoTableView.isHidden = false
                self?.errorView.isHidden = true
                self?.repoTableView.reloadData()
            }
        }
        self.viewModel.showNetworkErrorClosure = { [weak self] in
             DispatchQueue.main.async {
                self?.repoTableView.isHidden = true
                self?.showNetworkError()
            }
        }
    }
    
    func showNetworkError() {
        errorView.retryClosure = { [weak self] in
            self?.isLoading = true
            self?.viewModel.requestTrendingRepo()
        }
        DispatchQueue.main.async {
            self.errorView.startAnimating()
        }
    }
}

//MARK: Table View Datasource and Delegate

extension TrendingRepositoryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isLoading {
            return 10 // Dummy Loading Cells
        }else {
            return viewModel.tableViewNumberOfRows()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isLoading {
            guard let cellViewModel = viewModel.tableViewLoadingCellForRowAt(for: indexPath) else { return UITableViewCell.init() }
            let cell = LoadingTableViewCell.dequeueReuseableCell(tableView: tableView)
            cell.configure(with: cellViewModel)
            return cell
            
        }else {
            guard let cellViewModel = viewModel.tableViewCellForRowAt(for: indexPath) else { return UITableViewCell.init() }
            let cell = TrendingRepoTableViewCell.dequeueReuseableCell(tableView: tableView)
            cell.configure(with: cellViewModel)
            return cell
        }
    }
    
}
