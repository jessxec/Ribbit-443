//
//  UserServiceProtocol.swift
//  Ribbit
//
//  Created by Jorge Urias on 10/30/24.
//

protocol UserServiceProtocol {
    func fetchUser(by id: String, completion: @escaping (Result<User, Error>) -> Void)
    func createUser(_ user: User, completion: @escaping (Error?) -> Void)
    func updateUserProgress(userId: String, progress: LessonProgress, completion: @escaping (Error?) -> Void)
}
