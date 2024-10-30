//
//  UserViewModel.swift
//  Ribbit
//
//  Created by Jorge Urias on 10/30/24.
//

import Foundation


class UserViewModel: ObservableObject {
    private let userService: UserServiceProtocol
    
    @Published var user: User?
    @Published var isLoading = false
  
    init(userService: UserServiceProtocol = UserService()) {
        self.userService = userService
    }
    
    func fetchUser(id: String) {
        isLoading = true
        userService.fetchUser(by: id) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let user):
                    self?.user = user
                case .failure(let error):
                    print("Failed to fetch user:", error)
                }
            }
        }
    }
}
