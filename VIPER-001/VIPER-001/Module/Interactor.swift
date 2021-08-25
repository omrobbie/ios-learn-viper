//
//  Interactor.swift
//  VIPER-001
//
//  Created by omrobbie on 25/08/21.
//

import Foundation

protocol AnyInteractor {
    var presenter: AnyPresenter? {get set}

    func getUser()
}

class UserInteractor: AnyInteractor {
    var presenter: AnyPresenter?

    func getUser() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}

        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorDidFetchUsers(with: .failure(FetchError.failed))
                return
            }

            do {
                let entities = try JSONDecoder().decode([User].self, from: data)
                self?.presenter?.interactorDidFetchUsers(with: .success(entities))
            } catch {
                self?.presenter?.interactorDidFetchUsers(with: .failure(error))
            }
        }.resume()
    }
}
