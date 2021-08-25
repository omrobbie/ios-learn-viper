//
//  Router.swift
//  VIPER-001
//
//  Created by omrobbie on 25/08/21.
//

import UIKit

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entryPoint: EntryPoint? {get}

    static func start() -> AnyRouter
}

class UserRouter: AnyRouter {
    var entryPoint: EntryPoint?

    static func start() -> AnyRouter {
        let router = UserRouter()

        var view: AnyView = UserView()
        var presenter: AnyPresenter = UserPresenter()
        var interactor: AnyInteractor = UserInteractor()

        view.presenter = presenter

        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor

        router.entryPoint = view as? EntryPoint

        return router
    }
}
