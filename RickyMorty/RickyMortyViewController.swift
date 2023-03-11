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


class RickyMortyViewController: UIViewController, RickyMortyOutPut {
    func changeLoading(isLoad: Bool) {
        isLoad ? indicator.startAnimating() : indicator.stopAnimating()
    }
    
    func saveDatas(values: [Result]) {
        results = values
        self.tableView.reloadData()
    
    }
    
     let labelTitle : UILabel = UILabel()
     let indicator : UIActivityIndicatorView = UIActivityIndicatorView()
     let tableView : UITableView = UITableView()
    
     private lazy var results: [Result] = []
    
     lazy var viewModel: IRickyMortyViewModel = RickyMortyViewModel()
     
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        viewModel.setDelegate(output: self)
        viewModel.fetchItems()
    }
    
    private func configure() {
        view.addSubview(labelTitle)
        view.addSubview(tableView)
        view.addSubview(indicator)
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RickyMortyTableViewCell.self, forCellReuseIdentifier: RickyMortyTableViewCell.identifier.custom.rawValue)
        view.backgroundColor = .white
        labelTitle.text = "Ricky Morty"
        labelTitle.font = .boldSystemFont(ofSize: 25)
        indicator.color = .red
        indicator.startAnimating()
        
        tableView.rowHeight = 150
        
        labelTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.greaterThanOrEqualTo(10)
        }
        tableView.snp.makeConstraints { make in
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

extension RickyMortyViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell : RickyMortyTableViewCell = tableView.dequeueReusableCell(withIdentifier: RickyMortyTableViewCell.identifier.custom.rawValue) as? RickyMortyTableViewCell else {
            return UITableViewCell()
        }
        cell.saveModel(model: results[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
}

