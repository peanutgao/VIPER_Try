//
//  ItemListInteractor.swift
//  VIPER_Try
//
//  Created by Joseph Koh on 2024/6/20.
//

import Foundation


/// view的操作
protocol ItemListInteractorProtocol: AnyObject {
    func fetchItems()
}

/// 事件回调，返回处理操作的结果
protocol ItemListInteractorOutputProtocol: AnyObject {
    func didFetchItems(_ items: [String])
}

class ItemListInteractor: ItemListInteractorProtocol {
    
    weak var outputPresenter: ItemListInteractorOutputProtocol?
    
    func fetchItems() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            let items = ["Item 1", "Item 2", "Item 3"]
            print("Interactor: Fetch items: \(items)")
            
            self?.outputPresenter?.didFetchItems(items)
        }
    }
    
    
}
