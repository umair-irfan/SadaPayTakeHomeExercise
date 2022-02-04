//
//  CellViewInitializable.swift
//  TakeHomeExercise
//
//  Created by Umair Irfan on 29/06/2021.
//

import Foundation
import UIKit

protocol CellViewInitializable {
    static var reuseableIdentifier: String { get }
}

extension CellViewInitializable where Self: UITableViewCell {
    static var reuseableIdentifier: String {
        return String(describing: Self.self)
    }
    
    static func dequeueReuseableCell(tableView: UITableView) -> Self {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseableIdentifier) else {
            return UITableViewCell() as! Self
        }
        return cell as! Self
    }
}
