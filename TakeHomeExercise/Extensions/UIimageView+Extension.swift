//
//  UIimageView+Extension.swift
//  TakeHomeExercise
//
//  Created by Umair Irfan on 02/07/2021.
//

import Foundation
import UIKit

extension UIImageView {
    
    func downloadImage(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadImage(from: url, contentMode: mode)
    }
    
    func downloadImage(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
}
