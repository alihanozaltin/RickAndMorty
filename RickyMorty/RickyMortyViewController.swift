//
//  ViewController.swift
//  RickyMorty
//
//  Created by Alihan Özaltın on 6.03.2023.
//

import UIKit
import SnapKit

protocol RickyMortyOutPut {
    func changeLoading(isLoad: Bool)
    func saveDatas(values: [Result])
    
}


 class RickyMortyViewController: UIViewController {
     let labelTitle : UILabel = UILabel()
     let indicator : UIActivityIndicatorView = UIActivityIndicatorView()
     let box : UIView = UIView()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    
    }
    private func configure() {
        view.addSubview(labelTitle)
        view.addSubview(box)
        view.addSubview(indicator)
        box.backgroundColor = .red
        view.backgroundColor = .white
        labelTitle.text = "Ricky Morty"
        indicator.color = .red
        indicator.startAnimating()
        
        labelTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.greaterThanOrEqualTo(10)
        }
        box.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
            make.left.right.equalTo(labelTitle)
        }
        indicator.snp.makeConstraints { make in
            make.height.equalTo(labelTitle)
            make.right.equalTo(labelTitle).offset(-5)
            make.top.equalTo(labelTitle)
        }
    }


}

