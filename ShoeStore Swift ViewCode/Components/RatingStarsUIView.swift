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
    
    lazy var starStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        return stack
    }()
    
    func buildStar(filled: Bool) -> UIImageView {
        let image = UIImage(systemName: filled ? "star.fill" : "star")
        let imageView = UIImageView(image: image!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.autoresizingMask = .flexibleHeight
        imageView.tintColor = .orange // TODO: fill with correct color for dark mode
        return imageView
    }
    
    init(frame: CGRect, rating: Int, ofStars starsCount: Int){
        super.init(frame: frame)
        
        configSuperView(totalStars: starsCount, filledStars: rating)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configSuperView(totalStars: Int, filledStars: Int){
        backgroundColor = .systemBackground
        addSubview(starStackView)
        
        for i in 1...totalStars {
            starStackView.addArrangedSubview(buildStar(filled: i <= filledStars))
        }
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            //starStackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            //starStackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
            starStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            starStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            starStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            starStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

import SwiftUI
import UIViewCanvas

struct RatingStarsUIView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ViewCanvas(for: RatingStarsUIView(frame: .zero, rating: 3, ofStars: 5))
        }.previewLayout(.fixed(width: 125, height: 25))
    }
}

