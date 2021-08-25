//
//  Interactor.swift
//  VIPER-001
//
//  Created by omrobbie on 25/08/21.
//

import Foundation

protocol AnyInteractor {
    func getUser()
}

class UserInteractor: AnyInteractor {
    func getUser() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let entities = try JSONDecoder().decode([User].self, from: data)
                print(entities)
            } catch {
                return
            }
        }.resume()
    }
}
