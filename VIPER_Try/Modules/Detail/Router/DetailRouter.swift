//
//  DetailRouter.swift
//  VIPER_Try
//
//  Created by Joseph Koh on 2024/6/20.
//

import UIKit

protocol DetailRouterProtocol: AnyObject {
    static func createModule(with item: String) -> UIViewController
}


class DetailRouter: DetailRouterProtocol {
    weak var view: UIViewController?
    
    static func createModule(with item: String) -> UIViewController {
        let view = DetailViewController()
        let router = DetailRouter()
        let interactor = DetailInteractor()
        let presenter = DetailPresenter(
            view: view,
            router: router,
            interactor: interactor, 
            item: item  // 传递数据
        )
        
        view.presenter = presenter
        router.view = view
        interactor.outputPresenter = presenter
        
        return view
    }
}
