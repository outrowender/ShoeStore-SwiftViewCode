//
//  NavigationBarUIView.swift
//  ShoeStore Swift ViewCode
//
//  Created by Wender Patrick on 06/04/22.
//

import UIKit

protocol NavigationBarUIViewProtocol: AnyObject {
    func backButtonAction()
    func cartButtonAction()
}

class NavigationBarUIView: UIView {
    
    private weak var delegate: NavigationBarUIViewProtocol?
    
    func delegate(with delegate: NavigationBarUIViewProtocol?){
        self.delegate = delegate
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(self.backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var cartButton: UIButton = {
        let icon = UIImage(systemName: "cart")
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(icon, for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(self.cartButtonTapped), for: .touchUpInside)
        return button
    }()
    
    init(frame: CGRect, title: String){
        super.init(frame: frame)
        
        configSuperView(titleLabelText: title)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configSuperView(titleLabelText: String){
        self.backgroundColor = .systemBackground
        
        self.addSubview(backButton)
        self.addSubview(titleLabel)
        self.addSubview(cartButton)
        
        titleLabel.text = titleLabelText
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            backButton.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            
            cartButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            cartButton.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
        ])
    }
    
    @objc private func backButtonTapped() {
        self.delegate?.backButtonAction()    }
    
    @objc private func cartButtonTapped() {
        self.delegate?.cartButtonAction()
    }
    
}

import SwiftUI
import UIViewCanvas

struct NavigationBarUIView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ViewCanvas(for: NavigationBarUIView(frame: .zero, title: "Your title here"))
        }.previewLayout(.fixed(width: 350, height: 54))
    }
}
