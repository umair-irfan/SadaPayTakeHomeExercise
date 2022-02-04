//
//  Storyboard+Extension.swift
//  TakeHomeExercise
//
//  Created by Umair Irfan on 29/06/2021.
//

import Foundation
import UIKit

public extension UIStoryboard {
    enum Storyboard: String {
        case trendingRepo = "TrendingRespository"
        var filename: String {
            return rawValue
        }
    }

    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.filename, bundle: bundle)
    }
}
