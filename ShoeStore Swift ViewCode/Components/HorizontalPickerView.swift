//
//  HorizontalPickerView.swift
//  ShoeStore Swift ViewCode
//
//  Created by Wender Patrick on 11/04/22.
//

import UIKit

class HorizontalPickerView: UIView {
    
    let sizes: [String] = ["33","34","35","36","37","38","39","40","41","42","43"]
    var itemSelected: Int = 0
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.delegate = self
        view.dataSource = self
        view.isUserInteractionEnabled = false
        view.isPagingEnabled = true
        //view.contentInset = UIEdgeInsets(top: -10, left: 0, bottom:0, right: 0)
        
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configSuperView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configSuperView(){
        addSubview(collectionView)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
}

extension HorizontalPickerView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sizes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = sizes[indexPath.row]
        
        if indexPath.row == itemSelected {
            cell.backgroundColor = .blue
            label.tintColor = .white
        }
        
        cell.contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
//            label.topAnchor.constraint(equalTo: cell.topAnchor),
//            label.bottomAnchor.constraint(equalTo: cell.bottomAnchor),
//            label.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
//            label.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
            
            label.centerYAnchor.constraint(equalTo: cell.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: cell.centerXAnchor)
        ])
        return cell
    }
    
    // TODO: selection not working
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        itemSelected = indexPath.row
    }
}

import SwiftUI
import UIViewCanvas

struct HorizontalPickerView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ViewCanvas(for: HorizontalPickerView(frame: .zero))
        }.previewLayout(.fixed(width: 300, height: 50))
    }
}
