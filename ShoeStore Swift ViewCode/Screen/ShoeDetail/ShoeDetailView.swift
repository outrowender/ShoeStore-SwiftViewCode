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
        let view = NavigationBarUIView(frame: .zero, title: "Masculino")
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
    
    lazy var imageViewer: UIView = {
        let images = [
            URL(string: "https://raw.githubusercontent.com/outrowender/ShoeStore-SwiftViewCode/main/assets/tenis1.png")!,
            URL(string: "https://raw.githubusercontent.com/outrowender/ShoeStore-SwiftViewCode/main/assets/tenis2.png")!,
            URL(string: "https://raw.githubusercontent.com/outrowender/ShoeStore-SwiftViewCode/main/assets/tenis3.png")!
        ]
        
        let view = CarouselImageView(frame: .zero, urls: images)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var saveButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        let button = UIButton(type: .custom)
        configuration.image = UIImage(systemName: "heart.circle")
        configuration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 30)
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        
        //button.addTarget(self, action: #selector(self.cartButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var sizeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tamanho"
        return label
    }()
    
    lazy var colorsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Outras cores"
        return label
    }()
    
    lazy var sizePicker: UIView = {
        let view = HorizontalPickerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        backgroundColor = .systemBackground
        
        addSubview(navigationHeader)
        addSubview(titleLabel)
        addSubview(ratingView)
        addSubview(imageViewer)
        addSubview(saveButton)
        addSubview(sizeLabel)
        addSubview(sizePicker)
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
            
            saveButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            saveButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            saveButton.widthAnchor.constraint(equalToConstant: 50),
            
            ratingView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            ratingView.topAnchor.constraint(equalTo: navigationHeader.bottomAnchor, constant: 16),
            ratingView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            imageViewer.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            imageViewer.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            imageViewer.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -32),
            imageViewer.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor),
            
            sizeLabel.topAnchor.constraint(equalTo: imageViewer.bottomAnchor, constant: 16),
            sizeLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            sizePicker.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: 8),
            sizePicker.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            sizePicker.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 16),
            sizePicker.heightAnchor.constraint(equalToConstant: 32)
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
