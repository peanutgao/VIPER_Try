//
//  DetailPresenter.swift
//  VIPER_Try
//
//  Created by Joseph Koh on 2024/6/21.
//

import Foundation

protocol DetailPresenterProtocol: AnyObject {
    func viewDidLoad()
    func showDetail()
}


class DetailPresenter: DetailPresenterProtocol {
    
    weak var view: DetailViewProtocol?
    var router: DetailRouterProtocol?
    var interactor: DetailInteractorProtocol?
    
    
    var item: String?
    
    init(view: DetailViewProtocol,
         router: DetailRouterProtocol,
         interactor: DetailInteractorProtocol,
         item: String?) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.item = item
    }
    
    func viewDidLoad() {
        showDetail()
    }
    
    func showDetail() {
        view?.showDetail(for: item)
    }
}


extension DetailPresenter: DetailInteractorOutputProtocol {
    
}
