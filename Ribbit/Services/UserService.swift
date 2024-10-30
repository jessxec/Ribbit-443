//
//  UserService.swift
//  Ribbit
//
//  Created by Jorge Urias on 10/30/24.
//

import Foundation
import FirebaseFirestore

class UserService: UserServiceProtocol {
    private let db = Firestore.firestore()
    
    func fetchUser(by id: String, completion: @escaping (Result<User, Error>) -> Void) {
        db.collection("users").document(id).getDocument { (document, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                if let user = try document?.data(as: User.self) {
                    completion(.success(user))
                } else {
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "User not found."])))
                }
            } catch {
                completion(.failure(error))
            }
        }
    }

    func createUser(_ user: User, completion: @escaping (Error?) -> Void) {
        do {
            let userData = try Firestore.Encoder().encode(user)
            db.collection("users").document(user.id ?? UUID().uuidString).setData(userData) { error in
                completion(error)
            }
        } catch {
            completion(error)
        }
    }
    
    func updateUserProgress(userId: String, progress: LessonProgress, completion: @escaping (Error?) -> Void) {
        let updateData: [String: Any] = [
            "currentModule": progress.lessonName,
            "currentLesson": try? Firestore.Encoder().encode(progress)
        ]
        db.collection("users").document(userId).updateData(updateData) { error in
            completion(error)
        }
    }
}
