//
//  DetailInteractor.swift
//  VIPER_Try
//
//  Created by Joseph Koh on 2024/6/21.
//

import Foundation

protocol DetailInteractorProtocol: AnyObject {
    
}

/// 事件回调，返回处理操作的结果
protocol DetailInteractorOutputProtocol: AnyObject {
    
}



class DetailInteractor: DetailInteractorProtocol {
    
    weak var outputPresenter: DetailInteractorOutputProtocol?
}
