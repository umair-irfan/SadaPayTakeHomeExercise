//
//  LoadingTableViewCell.swift
//  TakeHomeExercise
//
//  Created by Umair Irfan on 01/07/2021.
//

import UIKit

class LoadingTableViewCell: UITableViewCell, CellViewInitializable {
    //MARK: Properties
    
    private var viewModel: LoadingTableViewCellViewModelType?
    
    
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
    
    func configure(with viewModel:LoadingTableViewCellViewModelType) {
        self.viewModel = viewModel
    }
}
