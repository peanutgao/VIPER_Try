//
//  DetailViewController.swift
//  VIPER_Try
//
//  Created by Joseph Koh on 2024/6/20.
//

import UIKit

protocol DetailViewProtocol: AnyObject {
    func showDetail(for item: String?)
}

class DetailViewController: UIViewController {
    
    var presenter: DetailPresenterProtocol?
    
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        presenter?.viewDidLoad()
        presenter?.showDetail()
    }
}

extension DetailViewController: DetailViewProtocol {
    func showDetail(for item: String?) {
        label.text = item
    }
}

private extension DetailViewController {
    func setupUI() {
        navigationItem.title = "Detail"
        view.backgroundColor = .systemPink
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
