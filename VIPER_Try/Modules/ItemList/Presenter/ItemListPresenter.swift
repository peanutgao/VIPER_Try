//
//  ItemListPresenter.swift
//  VIPER_Try
//
//  Created by Joseph Koh on 2024/6/20.
//

import Foundation


protocol ItemListPresenterProtocol: AnyObject {
    func viewDidLoad()
    func didSelectItem(_ item: String)
}

class ItemListPresenter: ItemListPresenterProtocol {
    public weak var view: ItemListViewProtocol?
    var interactor: ItemListInteractorProtocol?
    var router: ItemListRouterProcol?

    init(view: ItemListViewProtocol,
         router: ItemListRouterProcol,
         interactor: ItemListInteractorProtocol
    ){
        // 弱引用
        self.view = view
        self.router = router
        self.interactor = interactor
    }

    func viewDidLoad() {
        interactor?.fetchItems()
    }

    func didSelectItem(_ item: String) {
        router?.navigateToItemDetail(with: item)
    }
}

// MARK: ItemListInteractorOutputProtocol

/// 让ItemListPresenter实现ItemListInteractorOutputProtocol协议，用于接收Interactor返回的数据。
extension ItemListPresenter: ItemListInteractorOutputProtocol {
    func didFetchItems(_ items: [String]) {
        view?.showItems(items)
    }
}
