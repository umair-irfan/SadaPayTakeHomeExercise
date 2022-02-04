//
//  TrendingRepoTableViewCell.swift
//  TakeHomeExercise
//
//  Created by Umair Irfan on 29/06/2021.
//

import UIKit

class TrendingRepoTableViewCell: UITableViewCell, CellViewInitializable {
    
    //MARK: View
    @IBOutlet private var repoNameLabel: UILabel!
    @IBOutlet private var ownerNameLabel: UILabel!
    @IBOutlet private var starsLabel: UILabel!
    @IBOutlet private var userImage: UIImageView!
    
    //MARK: Properties
    
    private var viewModel: TrendingRepoTableViewCellViewModelType?
    
    
    // MARK: Initialization
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        selectionStyle = .none
    }

    //MARK: Configure Cellview
    
    func configure(with viewModel:TrendingRepoTableViewCellViewModelType) {
        self.viewModel = viewModel
        binding()
    }
    
}

private extension TrendingRepoTableViewCell {
    func binding(){
        repoNameLabel.text = viewModel?.getRespostryName()
        ownerNameLabel.text = viewModel?.getOwnerName()
        starsLabel.text = viewModel?.getStarsCount()
        userImage.downloadImage(from: viewModel?.getUserImage() ?? "")
    }
}
