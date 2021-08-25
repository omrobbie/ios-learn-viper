//
//  Presenter.swift
//  VIPER-001
//
//  Created by omrobbie on 25/08/21.
//

import Foundation

enum FetchError: Error {
    case failed
}

protocol AnyPresenter {
    var router: AnyRouter? {get set}
    var view: AnyView? {get set}
    var interactor: AnyInteractor? {get set}

    func interactorDidFetchUsers(with result: Result<[User], Error>)
}

class UserPresenter: AnyPresenter {
    var router: AnyRouter?
    var view: AnyView?

    var interactor: AnyInteractor? {
        didSet {
            interactor?.getUser()
        }
    }

    func interactorDidFetchUsers(with result: Result<[User], Error>) {
        switch result {
        case .success(let users):
            view?.update(with: users)
        case .failure:
            view?.update(with: "Something went wrong!")
        }
    }
}
