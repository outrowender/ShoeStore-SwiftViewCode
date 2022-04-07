//
//  ViewController.swift
//  ShoeStore Swift ViewCode
//
//  Created by Wender Patrick on 06/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    var shoeDetailView: ShoeDetailView?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        shoeDetailView = ShoeDetailView(frame: .zero)
        view = shoeDetailView
    }


}

