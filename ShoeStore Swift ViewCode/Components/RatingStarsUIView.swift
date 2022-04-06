//
//  RatingStarsUIView.swift
//  ShoeStore Swift ViewCode
//
//  Created by Wender Patrick on 06/04/22.
//

import UIKit

protocol RatingStarsUIViewProtocol: AnyObject {
    func starTappedAction()
}

class RatingStarsUIView: UIView {
    
    private weak var delegate: RatingStarsUIViewProtocol?
    
    func delegate(with delegate: RatingStarsUIViewProtocol?){
        self.delegate = delegate
    }
    
    lazy var filledStarImage1: UIImageView = {
        let image = UIImage(systemName: "star")
        let imageView = UIImageView(image: image!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var filledStarImage2: UIImageView = {
        let image = UIImage(systemName: "star")
        let imageView = UIImageView(image: image!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var filledStarImage3: UIImageView = {
        let image = UIImage(systemName: "star")
        let imageView = UIImageView(image: image!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var filledStarImage4: UIImageView = {
        let image = UIImage(systemName: "star")
        let imageView = UIImageView(image: image!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init(frame: CGRect, rating: Int){
        super.init(frame: frame)
        
        configSuperView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configSuperView(){
        self.backgroundColor = .systemBackground
        self.addSubview(filledStarImage1)
        self.addSubview(filledStarImage2)
        self.addSubview(filledStarImage3)
        self.addSubview(filledStarImage4)
        //self.addSubview(<#T##view: UIView##UIView#>)
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            filledStarImage1.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            filledStarImage1.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            
            filledStarImage2.leadingAnchor.constraint(equalTo: self.filledStarImage1.trailingAnchor),
            filledStarImage2.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            
            filledStarImage3.leadingAnchor.constraint(equalTo: self.filledStarImage2.trailingAnchor),
            filledStarImage3.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            
            filledStarImage4.leadingAnchor.constraint(equalTo: self.filledStarImage3.trailingAnchor),
            filledStarImage4.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
        ])
    }
}

import SwiftUI
import UIViewCanvas

struct RatingStarsUIView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ViewCanvas(for: RatingStarsUIView(frame: .zero, rating: 4))
        }.previewLayout(.fixed(width: 100, height: 25))
    }
}

