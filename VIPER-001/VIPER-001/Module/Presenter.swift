//
//  Presenter.swift
//  VIPER-001
//
//  Created by omrobbie on 25/08/21.
//

import Foundation

protocol AnyPresenter {
    var router: AnyRouter? {get set}
    var view: AnyView? {get set}
}

class UserPresenter: AnyPresenter {
    var router: AnyRouter?
    var view: AnyView?
}
