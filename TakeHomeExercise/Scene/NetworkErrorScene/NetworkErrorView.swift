//
//  NetworkErrorView.swift
//  TakeHomeExercise
//
//  Created by Umair Irfan on 02/07/2021.
//

import UIKit

class NetworkErrorView: UIView {
    //MARK: View
    let nibName = "NetworkErrorView"
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var retryButton: UIButton!
    
    //MARK:- Properties
    var retryClosure: (()->())?
    
    //MARK: Initializer
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        setupView()
    }
    
    func startAnimating() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: { [weak self] in
            self?.animationView.showAnimation(aimationName: "4506-retry-and-user-busy-version-2")
        })
    }
}
private extension NetworkErrorView {
    func loadViewFromNib() -> UIView? {
           let bundle = Bundle(for: type(of: self))
           let nib = UINib(nibName: nibName, bundle: bundle)
           return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func setupView(){
        retryButton.layer.borderWidth = 1
        retryButton.layer.borderColor = #colorLiteral(red: 0.03529411765, green: 0.6745098039, blue: 0.3882352941, alpha: 1)
        retryButton.addTarget(self, action: #selector(retryNetworkRequest), for: .touchUpInside)
    }
    
    @objc func retryNetworkRequest() {
        retryClosure?()
    }
}
