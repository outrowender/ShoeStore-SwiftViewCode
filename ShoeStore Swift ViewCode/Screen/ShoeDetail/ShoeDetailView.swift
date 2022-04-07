//
//  ShowDetailView.swift
//  ShoeStore Swift ViewCode
//
//  Created by Wender Patrick on 06/04/22.
//

import UIKit

protocol ShoeDetailViewProtocol: AnyObject {
    func actionAddToCart()
}

class ShoeDetailView: UIView {
    private weak var delegate: ShoeDetailViewProtocol?
    
    func delegate(with delegate: ShoeDetailViewProtocol?){
        self.delegate = delegate
    }
    
    lazy var navigationHeader: UIView = {
        let view = NavigationBarUIView(frame: .zero, title: "Feminino")
        //view.delegate(with: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var ratingView: UIView = {
        let view = RatingStarsUIView(frame: .zero, rating: 3, ofStars: 4)
        //view.delegate(with: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Tênis Ultraboost Web DNA"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(40.0)
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        configSuperView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configSuperView(){
        self.backgroundColor = .systemBackground
        
        self.addSubview(navigationHeader)
        self.addSubview(titleLabel)
        self.addSubview(ratingView)
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            navigationHeader.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            navigationHeader.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            navigationHeader.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            navigationHeader.heightAnchor.constraint(equalToConstant: 54),
            
            titleLabel.topAnchor.constraint(equalTo: navigationHeader.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: ratingView.leadingAnchor),
            
            ratingView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            ratingView.topAnchor.constraint(equalTo: navigationHeader.bottomAnchor, constant: 16),
            ratingView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }
}

import SwiftUI
import UIViewCanvas

struct ShoeDetailView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ViewCanvas(for: ShoeDetailView())
        }
    }
}
