//
//  StoryboardInitializable.swift
//  TakeHomeExercise
//
//  Created by Umair Irfan on 29/06/2021.
//

import Foundation
import UIKit


public protocol StoryboardInitializable {
    static var storyboardIdentifier: String { get }
}

public extension StoryboardInitializable where Self: UIViewController {

    static var storyboardIdentifier: String {
        return String(describing: Self.self)
    }

    static func initFromStoryboard(name: String = "Main") -> Self {
        let storyboard = UIStoryboard(name: name, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
    }

    static func initFrom(storyboard: UIStoryboard.Storyboard) -> Self {
        return initFromStoryboard(name: storyboard.filename)
    }
}
