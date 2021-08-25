//
//  View.swift
//  VIPER-001
//
//  Created by omrobbie on 25/08/21.
//

import UIKit

protocol AnyView {
    var presenter: AnyPresenter? {get set}
}

class UserView: UIViewController, AnyView {
    var presenter: AnyPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
    }
}
