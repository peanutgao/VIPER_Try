//
//  ItemListViewController.swift
//  VIPER_Try
//
//  Created by Joseph Koh on 2024/6/20.
//

import UIKit

protocol ItemListViewProtocol: AnyObject {
    func showItems(_ items: [String])
}

class ItemListViewController: UIViewController {

    var presenter: (ItemListPresenterProtocol & ItemListInteractorOutputProtocol)?
    
    private var items: [String] = []
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "List"
        view.backgroundColor = .white
        
        setupTableView()
        presenter?.viewDidLoad()
    }
    
}

extension ItemListViewController: ItemListViewProtocol {
    func showItems(_ items: [String]) {
        print("View: Show items: \(items)")
        self.items = items
        tableView.reloadData()
    }
}

extension ItemListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        presenter?.didSelectItem(item)
    }
}

private extension ItemListViewController {
    
    func setupTableView() {
            view.addSubview(tableView)
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        }
}
