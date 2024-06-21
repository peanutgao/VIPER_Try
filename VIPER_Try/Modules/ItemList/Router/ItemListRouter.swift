//
//  ItemListRouter.swift
//  VIPER_Try
//
//  Created by Joseph Koh on 2024/6/20.
//

import UIKit

// MARK: - ItemListRouterProcol

protocol ItemListRouterProcol: AnyObject {
    static func createModule() -> ItemListViewController

    func navigateToItemDetail(with item: String)
}

// MARK: - ItemListRouter

/**
 在Router中，将视图、Presenter、Interactor和Router进行组装，并通过协议接口进行连接。
 */
class ItemListRouter: ItemListRouterProcol {
    weak var view: UIViewController?

    static func createModule() -> ItemListViewController {
        let view = ItemListViewController()
        let router = ItemListRouter()
        let interactor = ItemListInteractor()
        let presenter = ItemListPresenter(
            view: view, // 弱引用
            router: router, // 强引用
            interactor: interactor // 强引用
        )
        view.presenter = presenter
        // 弱引用
        interactor.outputPresenter = presenter // presenter实现了ItemListInteractorOutputProtocol协议
        // 弱引用
        router.view = view

        return view
    }
}

extension ItemListRouter {
    func navigateToItemDetail(with item: String) {
        let detailVC = DetailRouter.createModule(with: item)
        view?.navigationController?.pushViewController(detailVC, animated: true)
    }
}
